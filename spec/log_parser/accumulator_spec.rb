# frozen_string_literal: true

RSpec.describe LogParser::Accumulator do
  let(:accumulator) { described_class.new }
  let(:entry) { LogParser::Entry.new('/about', '10.12.20.17') }

  it { is_expected.to respond_to(:total) }
  it { is_expected.to respond_to(:unique) }

  describe '#add' do
    before do
      accumulator.add(entry)
    end

    it 'increases total' do
      expect(accumulator.total).to eq(1)
    end

    it 'increases unique' do
      expect(accumulator.unique.length).to eq(1)
    end
  end
end
