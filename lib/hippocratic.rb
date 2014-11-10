require "open-uri"
require "nokogiri"
require "hippocratic/version"

module Hippocratic

  class DrugReference

    attr_accessor :description, :dosage, :other_names, :side_effects, :storage

    REFERENCE_HASH = {
        description: "What is",
        dosage: "What is the usual dosage",
        other_names: "Other names",
        side_effects: "What are the possible side effects",
        storage: "How should I store"
    }

    # assign instance variables for attributes (description, dosage, other names, side effects, storage)
    # that are contained within a question node on page
    # TODO rescue from 404 / include as part of validation
    def initialize(drug_name)
      @drug_name = drug_name
      @document = Nokogiri::HTML(open(Hippocratic.base_uri + @drug_name))
      @article = @document.css("article")
      for key in REFERENCE_HASH.keys do
        send "#{key}=", find_node(key)
      end
    end

    def valid?
      header = @document.css("h1").first
      header.text == @drug_name
    end

    private

    def find_node(key)
      term = REFERENCE_HASH[key]
      header_node = @article.search("[text()*='#{term}']").first
      return nil unless header_node
      header_node.parent.text
    end

  end

  private
  # not actually the pdr but same publishers. need To index pdr drugs before we can use that
  def self.base_uri
    "http://www.pdrhealth.com/drugs/"
  end
end
