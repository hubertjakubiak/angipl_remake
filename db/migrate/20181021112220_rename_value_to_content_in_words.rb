class RenameValueToContentInWords < ActiveRecord::Migration[5.2]
  def change
    rename_column :words, :value, :content
  end
end
