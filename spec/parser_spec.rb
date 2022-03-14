# frozen_string_literal: true

RSpec.describe Parser do
  let(:parser) { described_class.new }
  let(:path) { File.expand_path('fixtures/sample.log', __dir__) }

  describe '#parse' do
    subject(:data) { parser.parse([path]) }

    let(:output) do
      ['/home 3 visits', '/index 2 visits', '/about 1 visits', '/home 3 unique views', '/index 2 unique views',
       '/about 1 unique views']
    end

    it { is_expected.to eql(output) }

    context 'with invalid path' do
      let(:path) { 'missing.log' }

      it 'raises error' do
        expect { data }.to raise_error(LogParser::Error)
      end
    end

    context 'with invalid file' do
      let(:path) { 'missing' }

      it 'raises error' do
        expect { data }.to raise_error(LogParser::Error)
      end
    end
  end
end
