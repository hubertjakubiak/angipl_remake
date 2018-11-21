require 'rails_helper'

describe Words::CheckAnswer do
  describe '#call' do
    subject { described_class.new(word, answer).call }

    context 'when user provided good answer' do
      let(:word) { create(:word, :with_translations) }
      let(:answer) { word.translations.first.content }

      it { is_expected.to eq(true) }
    end

    context 'when user provided bad answer' do
      let(:word) { create(:word, :with_translations) }
      let(:answer) { 'qwe123' }

      it { is_expected.to eq(false) }
    end
  end
end
