require "open-uri"
require "nokogiri"
require "hippocratic/version"

module Hippocratic

  class DrugReference

    REFERENCE_HASH = {
        description: "What is",
        dosage: "What is the usual dosage",
        other_names: "Other names",
        side_effects: "What are the possible side effects",
        storage: "How should I store"
    }

    # TODO rescue from 404 / include as part of validation
    def initialize(drug_name)
      @drug_name = drug_name
      @document = Nokogiri::HTML(open(Hippocratic.base_uri + @drug_name))
      @article = @document.css("article")
    end

    def valid?
      header = @document.css("h1").first
      header.text == @drug_name
    end

    def description
      @description ||= find_node(:description)
    end

    def dosage
      @dosage ||= find_node(:dosage)
    end

    def other_names
      @other_names ||= find_node(:other_names)
    end

    def side_effects
      @side_effects ||= find_node(:side_effects)
    end

    def storage
      @storage ||= find_node(:storage)
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

  def self.base_uri
    "http://www.pdrhealth.com/drugs/"
  end
end
