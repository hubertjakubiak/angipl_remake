class Word < ApplicationRecord
  validates :content, :language, presence: true
end
