require 'rails_helper'

describe Words::CheckAnswer do
  describe '#call' do
    subject { described_class.new(word, game, answer).call }

    let(:game) { create(:game) }

    context 'when user provided good answer' do
      let(:word) { create(:word, :with_translations) }
      let(:answer) { word.translations.first.content }

      it { is_expected.to eq(true) }

      it do
        expect { subject }.to change { game.reload.good_answers_count }.from(0).to(1)
      end

      it do
        expect { subject }.not_to change { game.reload.bad_answers_count }
      end
    end

    context 'when user provided bad answer' do
      let(:word) { create(:word, :with_translations) }
      let(:answer) { 'qwe123' }

      it { is_expected.to eq(false) }

      it do
        expect { subject }.to change { game.reload.bad_answers_count }.from(0).to(1)
      end

      it do
        expect { subject }.not_to change { game.reload.good_answers_count }
      end
    end
  end
end
