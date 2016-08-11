class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :post_id
      t.string :post_type

      t.timestamps(null: false)
    end
  end
end
