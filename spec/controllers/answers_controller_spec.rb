require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe 'POST create' do
    subject { post :create, xhr: true, params: params }

    context 'when user is signed in' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      context 'valid params' do
        let(:word) { create(:word, :with_translations) }
        let(:game) { create(:game, user: user) }
        let(:answer) { 'cat' }
        let(:params) do
          { answer: { content: answer, word_id: word.id, game_id: game.id } }
        end

        it do
          subject
          expect(response).to have_http_status(200)
        end

        it 'calls service to check answer' do
          expect(Words::CheckAnswer)
            .to receive(:new)
            .with(word, game, answer)
            .and_call_original
          expect_any_instance_of(Words::CheckAnswer)
            .to receive(:call)
          subject
        end
      end
    end
  end
end
