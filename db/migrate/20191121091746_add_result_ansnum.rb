class AddResultAnsnum < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :result, :boolean
    add_column :answers, :ansnum, :integer
  end
end
