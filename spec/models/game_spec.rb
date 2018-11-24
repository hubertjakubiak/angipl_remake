require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'columns' do
    it { is_expected.to have_db_column(:good_answers_count) }
    it { is_expected.to have_db_column(:bad_answers_count) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe '#correctness' do
    subject { game.correctness }

    let(:game) do
      build_stubbed(
        :game,
        good_answers_count: good_answers_count,
        bad_answers_count: bad_answers_count
      )
    end

    context 'when good_answers_count is 0' do
      let(:good_answers_count) { 0 }

      context 'when bad_answers_count is 0' do
        let(:bad_answers_count) { 0 }

        it { is_expected.to eq('-') }
      end

      context 'when bad_answers_count is 1' do
        let(:bad_answers_count) { 1 }

        it { is_expected.to eq('0.0%') }
      end
    end

    context 'when good_answers_count is 1' do
      let(:good_answers_count) { 1 }

      context 'when bad_answers_count is 0' do
        let(:bad_answers_count) { 0 }

        it { is_expected.to eq('100.0%') }
      end

      context 'when bad_answers_count is 1' do
        let(:bad_answers_count) { 1 }

        it { is_expected.to eq('50.0%') }
      end
    end

    context 'when good_answers_count is 2' do
      let(:good_answers_count) { 2 }

      context 'when bad_answers_count is 4' do
        let(:bad_answers_count) { 4 }

        it { is_expected.to eq('33.33%') }
      end
    end
  end
end
