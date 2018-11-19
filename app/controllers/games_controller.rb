class GamesController < ApplicationController
  before_action :authenticate_user!, only: %i[create show]

  def create
    game = current_user.games.create
    redirect_to(game)
  end

  def show
    @game = Game.find(params[:id])
    authorize @game
    @word = Words::RandomWord.new.call
  end
end
