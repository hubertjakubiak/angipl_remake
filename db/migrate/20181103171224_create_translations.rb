class CreateTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :translations do |t|
      t.references :word, index: true
      t.references :translated_word, index: true
      t.timestamps
    end

    add_foreign_key :translations, :words, column: :word_id
    add_foreign_key :translations, :words, column: :translated_word_id
  end
end
