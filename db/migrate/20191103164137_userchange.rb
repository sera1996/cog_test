class Userchange < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :male, :gender
    change_column :users, :gender, :string
  end
end
