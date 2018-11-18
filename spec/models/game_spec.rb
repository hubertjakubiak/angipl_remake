require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:good_answers_count) }
    it { is_expected.to have_db_column(:bad_answers_count) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end
end
