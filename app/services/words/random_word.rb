module Words
  class RandomWord
    def call
      get_random_word
    end

    private

    def get_random_word
      Word.order(Arel.sql('RANDOM()')).limit(1).first
    end
  end
end
