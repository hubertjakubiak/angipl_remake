require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:content) }
  end

  describe 'nested attributes' do
    it { is_expected.to accept_nested_attributes_for(:translations).allow_destroy(true) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:language) }
    it { is_expected.to belong_to(:user) }
    it do
      is_expected.to have_many(:translations_association)
        .class_name('Translation')
    end
    it do
      is_expected.to have_many(:translations)
        .through(:translations_association)
        .source(:translated_word)
        .dependent(:destroy)
    end
    it do
      is_expected.to have_many(:inverse_translations_association)
        .class_name('Translation')
        .with_foreign_key('translated_word_id')
    end
    it do
      is_expected.to have_many(:inverse_translations)
        .through(:inverse_translations_association)
        .source(:word)
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }

    describe '#translations_cannot_be_in_the_same_language_as_word' do
      let(:language_1) { create(:language) }
      let(:word_1) { build(:word, language: language_1) }

      context 'when translation is in the same language' do
        let(:word_2) { build(:word, language: language_1) }

        before do
          word_1.translations = [word_2]
        end

        it do
          expect(word_1).to be_invalid
        end
      end

      context 'when translation is NOT in the same language' do
        let(:language_2) { create(:language, :polish) }
        let(:word_2) { build(:word, language: language_2) }

        before do
          word_1.translations = [word_2]
        end

        it do
          expect(word_1).to be_valid
        end
      end
    end
  end
end
