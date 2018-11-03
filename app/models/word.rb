class Word < ApplicationRecord
  belongs_to :language
  belongs_to :user
  validates :content, :language, presence: true

  paginates_per 10
end
