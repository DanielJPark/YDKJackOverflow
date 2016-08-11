class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.text :content
      t.integer :user_id
      t.integer :category_id
      t.integer :selected_answer_id

      t.timestamps(null: false)
    end
  end
end
