# frozen_string_literal: true

RSpec.describe LogParser::Entry do
  let(:entry) { described_class.new(path, ip) }
  let(:path) { '/about' }
  let(:ip) { '112.10.20.12' }

  describe '.class' do
    it 'is a struct' do
      expect(entry.class.superclass).to be(Struct)
    end

    it 'path should be /about' do
      expect(entry.path).to eql('/about')
    end

    it 'ip should be 112.10.20.12' do
      expect(entry.ip).to eql('112.10.20.12')
    end
  end
end
