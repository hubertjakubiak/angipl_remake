class GamePolicy
  attr_reader :user, :game

  def initialize(user, game)
    @user = user
    @game = game
  end

  def show?
    game_belongs_to_user?
  end

  private

  def game_belongs_to_user?
    user == game.user
  end
end
