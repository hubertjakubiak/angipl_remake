class Word < ApplicationRecord
  validates :content, :language, presence: true
  validates :language, inclusion: { in: LanguageList::COMMON_LANGUAGES.map(&:name) }
end
