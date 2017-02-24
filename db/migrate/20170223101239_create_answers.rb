class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :text
      t.integer :vote_count, default: 0
      t.references :question
      t.references :user

      t.timestamps null: false
    end
  end
end
