require 'rails_helper'

describe Words::RandomWord do
  describe '#call' do
    subject { described_class.new.call }

    let!(:word) { create(:word) }

    it do
      expect(subject).to eq(word)
    end
  end
end
