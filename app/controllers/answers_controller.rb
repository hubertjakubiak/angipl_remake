class AnswersController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    checker = Words::CheckAnswer.new(word, game, answer).call
    redirect_back(fallback_location: root_path, notice: checker.message)
  end

  private

  def word
    Word.find(params[:answer][:word_id])
  end

  def answer
    params[:answer][:content]
  end

  def game
    Game.find(params[:answer][:game_id])
  end
end
