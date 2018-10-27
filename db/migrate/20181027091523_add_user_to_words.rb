class AddUserToWords < ActiveRecord::Migration[5.2]
  def change
    add_reference :words, :user, index: true, foreign_key: true
  end
end
