require 'rails_helper'

RSpec.describe Translation, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:word) }
    it { is_expected.to belong_to(:translated_word).class_name('Word') }
  end
end
