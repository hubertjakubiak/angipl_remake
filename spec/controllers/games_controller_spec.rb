require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'POST create' do
    subject { post :create }

    context 'when user is signed in' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      it 'redirects to new game' do
        expect(subject).to redirect_to(user.games.last)
      end

      it do
        subject
        expect(response).to have_http_status(302)
      end
    end

    context 'when user is NOT signed in' do
      it 'does not redirect to new game' do
        expect(subject).not_to redirect_to(Game.last)
      end

      it do
        subject
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'GET show' do
    subject { get :show, params: params }

    context 'when user is signed in' do
      let(:user) { create(:user) }

      before { sign_in(user) }

      let(:params) do
        { id: game.id }
      end
      let!(:game) { create(:game, user: user) }

      it 'assigns @game' do
        subject
        expect(assigns(:game)).to eq(game)
      end

      it 'renders the show template' do
        subject
        expect(response).to render_template(:show)
      end
    end

    context 'when user is NOT signed in' do
      let(:params) do
        { id: game.id }
      end
      let!(:game) { create(:game) }

      it 'does not assign @game' do
        subject
        expect(assigns(:game)).not_to eq(game)
      end

      it 'does not render the show template' do
        subject
        expect(response).not_to render_template(:show)
      end

      it do
        subject
        expect(response).to have_http_status(302)
      end
    end
  end
end
