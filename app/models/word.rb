class Word < ApplicationRecord
  validates :content, presence: true
end
