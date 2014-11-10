require 'spec_helper'

describe Hippocratic do

  describe Hippocratic::DrugReference do

    context "Normal one-word drug name, with other names" do
      subject { Hippocratic::DrugReference.new("Sudafed") }

      it 'has Sudafed description' do
        expect(
            subject.description
        ).to include("contains a nasal decongestant")
      end

      it 'has Sudafed dosage' do
        expect(subject.dosage.downcase).to include("adults")
      end

      it 'has Sudafed other names' do
        expect(subject.other_names).to include("Sudafed Congestion")
      end

      it 'has Sudafed side effects' do
        expect(subject.side_effects).to include("bowel obstruction")
      end

      it 'has Sudafed storage info' do
        expect(subject.storage).to include("room temperature")
      end
    end

    context "drug name with dash" do
      subject { Hippocratic::DrugReference.new("Toprol-XL") }

      it 'has Toprol-XL description' do
        expect(
            subject.description
        ).to include("beta-blocker")
      end

      it 'has Toprol-XL dosage' do
        expect(subject.dosage.downcase).to include("adults")
      end

      it 'has Toprol-XL other names' do
        expect(subject.other_names).to eq(nil)
      end

      it 'has Toprol-XL side effects' do
        expect(subject.side_effects).to include("diarrhea")
      end

      it 'has Toprol-XL storage info' do
        expect(subject.storage).to include("room temperature")
      end
    end

    context "drug name with slash" do
      subject { Hippocratic::DrugReference.new("Derma-Smoothe/FS Scalp Oil") }

      it 'has Toprol-XL description' do
        expect(subject.description).to include("topical medicine")
      end

      it 'has Toprol-XL dosage' do
        expect(subject.dosage.downcase).to include("adults")
      end

      it 'has Toprol-XL other names' do
        expect(subject.other_names).to eq(nil)
      end

      it 'has Toprol-XL side effects' do
        expect(subject.side_effects).to include("acne")
      end

      it 'has Toprol-XL storage info' do
        expect(subject.storage).to include("room temperature")
      end
    end

    context "drug name with spaces" do
      subject { Hippocratic::DrugReference.new("Advil Cold and Sinus") }

      it 'has advil description' do
        expect(subject.description).to include("nasal decongestant")
      end

      it 'has advil dosage' do
        expect(subject.dosage.downcase).to include("adults")
      end

      it 'has advil other names' do
        expect(subject.other_names).to include("Advil Cold and Sinus Caplets")
      end

      it 'has advil side effects' do
        expect(subject.side_effects).to include("allergic reaction")
      end

      it 'has advil storage info' do
        expect(subject.storage).to include("room temperature")
      end
    end

    context "drug name with apostrophe" do
      subject { Hippocratic::DrugReference.new("Children's Tylenol") }

      it 'has advil description' do
        expect(subject.description).to include("pain reliever/fever reducer")
      end

      it 'has advil dosage' do
        expect(subject.dosage.downcase).to include("children")
      end

      it 'has advil other names' do
        expect(subject.other_names).to include("Children's Tylenol Suspension Liquid Grape")
      end

      it 'has advil side effects' do
        expect(subject.side_effects).to include("Severe liver damage")
      end

      it 'has advil storage info' do
        expect(subject.storage).to include("room temperature")
      end
    end

    context "normal drug name with no other names" do
      subject { Hippocratic::DrugReference.new("Ambien") }

      it 'has ambien description' do
        expect(
            subject.description
        ).to include("insomnia")
      end

      it 'has ambien dosage' do
        expect(subject.dosage.downcase).to include("adults")
      end

      it 'returns nil for other names' do
        expect(subject.other_names).to eq(nil)
      end

      it 'has ambien side effects' do
        expect(subject.side_effects).to include("diarrhea")
      end

      it 'has ambien storage info' do
        expect(subject.storage).to include("room temperature")
      end
    end

  end


end