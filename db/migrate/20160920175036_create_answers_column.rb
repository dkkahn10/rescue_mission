class CreateAnswersColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :question_id, :integer, null: false 
  end
end
