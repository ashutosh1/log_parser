# frozen_string_literal: true

RSpec.describe LogParser::Aggregator do
  let(:aggregator) { described_class.new(lines) }
  let(:lines) { ['/about 10.12.20.17', '/about 10.12.20.17', '/about 10.12.21.17', '/home 10.12.21.17'] }

  describe '#sort_and_return_all' do
    subject(:data) { aggregator.sort_and_return_all }

    let(:expected_data) do
      ['/about 3 visits', '/home 1 visits', '/about 2 unique views', '/home 1 unique views']
    end

    it { is_expected.to eql(expected_data) }
  end
end
