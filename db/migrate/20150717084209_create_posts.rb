class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.string :description
      t.boolean :published

      t.timestamps null: false
    end
  end
end
