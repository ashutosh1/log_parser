# frozen_string_literal: true

RSpec.describe LogParser::FileReader do
  let(:reader) { described_class.new(path) }
  let(:path) { File.expand_path('../fixtures/sample.log', __dir__) }

  describe '#lines' do
    subject(:lines) { reader.lines }

    let(:expected_lines) do
      ['/home 184.123.665.067', '/home 184.123.665.57', '/home 184.123.665.67', '/about 444.701.448.104',
       '/index 444.701.448.14', '/index 444.701.448.104']
    end

    it { is_expected.to eql(expected_lines) }

    context 'with invalid path' do
      let(:path) { 'missing.log' }

      it 'raises error' do
        expect { lines }.to raise_error(LogParser::Error)
      end
    end

    context 'with invalid file' do
      let(:path) { 'missing' }

      it 'raises error' do
        expect { lines }.to raise_error(LogParser::Error)
      end
    end
  end
end
