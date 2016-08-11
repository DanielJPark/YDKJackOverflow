class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title, null: false
      t.text :content, null: false
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :selected_answer_id

      t.timestamps(null: false)
    end
  end
end
