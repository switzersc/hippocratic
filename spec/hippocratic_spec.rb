require 'spec_helper'

describe Hippocratic do

  describe Hippocratic::DrugReference do
    context "Sudafed" do
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

    context "Ambien" do
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