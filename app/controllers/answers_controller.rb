class AnswersController < ApplicationController
  before_action :authenticate_user!, only: %i[create]

  def create
    authorize(game, :access?)
    checker = Words::CheckAnswer.new(word, game, answer)
    @checker = checker.call
    respond_to do |format|
      format.js
    end
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
