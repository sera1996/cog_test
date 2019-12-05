class SetScoreDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :score, 0
  end
end
