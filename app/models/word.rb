class Word < ApplicationRecord
  belongs_to :language
  belongs_to :user
  validates :content, :language, presence: true
end
