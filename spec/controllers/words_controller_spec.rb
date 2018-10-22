require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  describe 'GET index' do
    before { get :index }

    context 'when some words present' do
      let!(:word) { create(:word) }

      it 'assigns @words' do
        expect(assigns(:words)).to eq([word])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'when no words' do
      it 'assigns @words' do
        expect(assigns(:words)).to eq([])
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end
    end
  end

  describe 'GET new' do
    before { get :new }

    it 'assigns @word' do
      expect(assigns(:word)).to be_a_new(Word)
    end

    it 'renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    subject { post :create, params: params }

    context 'valid params' do
      let!(:language) { create(:language) }
      let(:params) do
        { word: { content: 'cat', language_id: language.id } }
      end

      it 'creates new word' do
        expect { subject }.to change(Word, :count).from(0).to(1)
      end
    end

    context 'invalid params' do
      let(:params) do
        { word: { content: '' } }
      end

      it 'does not create new word' do
        expect { subject }.not_to change(Word, :count)
      end
    end
  end

  describe 'GET show' do
    before { get :show, params: params }

    let(:params) do
      { id: word.id }
    end
    let!(:word) { create(:word) }

    it 'assigns @word' do
      expect(assigns(:word)).to eq(word)
    end

    it 'renders the show template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET edit' do
    before { get :edit, params: params }

    let(:params) do
      { id: word.id }
    end
    let!(:word) { create(:word) }

    it 'assigns @word' do
      expect(assigns(:word)).to eq(word)
    end

    it 'renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT update' do
    subject { put :update, params: params }

    let!(:word) { create(:word, content: 'cat', language: language_1) }
    let!(:language_1) { create(:language, name: 'English') }
    let!(:language_2) { create(:language, name: 'Polish') }

    context 'valid params' do
      let(:params) do
        { id: word.id, word: { content: 'kot', language_id: language_2.id } }
      end

      it 'updates word' do
        expect { subject }
          .to change { word.reload.content }
          .from('cat')
          .to('kot')
          .and change { word.reload.language }
          .from(language_1)
          .to(language_2)
      end
    end

    context 'invalid params' do
      let(:params) do
        { id: word.id, word: { content: '' } }
      end

      it 'does not update word' do
        expect { subject }.not_to change { word.reload.content }
      end
    end
  end

  describe 'DELETE destroy' do
    subject { delete :destroy, params: params }

    let!(:word) { create(:word) }

    context 'valid params' do
      let(:params) do
        { id: word.id }
      end

      it 'deletes word' do
        expect { subject }.to change(Word, :count).from(1).to(0)
      end
    end
  end
end
