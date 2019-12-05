class DefaultAnswerScore < ActiveRecord::Migration[5.2]
  def change
    change_column_default :answers, :score, 0
  end
end
