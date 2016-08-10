class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :content
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :selected_answer_id

      t.timestamps
    end
  end
end
