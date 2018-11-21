module Words
  class CheckAnswer
    def initialize(word, answer)
      @word = word
      @answer = answer
    end

    def call
      check_answer
    end

    private

    attr_reader :word, :answer

    def check_answer
      word.translations.where(content: answer).exists?
    end
  end
end
