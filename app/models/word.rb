class Word < ApplicationRecord
  validates :value, :language, presence: true
end
