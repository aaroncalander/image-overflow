class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :img_link
      t.string :body
      t.references :user

      t.timestamps null: false
    end
  end
end
