class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :description, null: false
      t.boolean :best, default: false

      t.timestamps null: false
    end
  end
end
