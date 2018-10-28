class WordPolicy
  attr_reader :user, :word

  def initialize(user, word)
    @user = user
    @word = word
  end

  def edit?
    word_belongs_to_user?
  end

  def update?
    word_belongs_to_user?
  end

  def destroy?
    word_belongs_to_user?
  end

  private

  def word_belongs_to_user?
    user == word.user
  end
end
