# frozen_string_literal: true

RSpec.describe LogParser::OptionExtractor do
  let(:op_extractor) { described_class.new(args) }
  let(:args) { ['file_path'] }

  describe '#lines' do
    subject(:file_path) { op_extractor.file_path }

    let(:expected_path) { 'file_path' }

    it { is_expected.to eql(expected_path) }

    context 'with no argument' do
      let(:args) { [] }

      it 'raises error' do
        expect { file_path }.to raise_error(LogParser::Error)
      end
    end
  end
end
