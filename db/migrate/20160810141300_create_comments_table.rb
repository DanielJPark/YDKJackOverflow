class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.string :post_type, null: false

      t.timestamps
    end
  end
end
