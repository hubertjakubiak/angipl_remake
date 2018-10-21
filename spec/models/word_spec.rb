require 'rails_helper'

RSpec.describe Word, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:content) }
    it { is_expected.to have_db_column(:language) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:language) }
    it do
      is_expected.to validate_inclusion_of(:language)
        .in_array(LanguageList::COMMON_LANGUAGES.map(&:name))
    end
  end
end
