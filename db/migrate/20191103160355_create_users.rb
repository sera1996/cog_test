class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.integer :grade
      t.boolean :male
      t.boolean :femal
      t.timestamps
    end
    #rename_column :users, :gender, :male
  end
end
