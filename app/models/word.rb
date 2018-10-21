class Word < ApplicationRecord
  belongs_to :language
  validates :content, :language, presence: true
end
