class UserChange < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :male, :gender
    #add_column :users, :female, :boolean
    change_column :users, :gender, :string
  end
end
