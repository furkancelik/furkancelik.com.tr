class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :top_content
      t.text :main_content
      t.string :description
      t.string :keywords
      t.string :link
      t.boolean :publish

      t.timestamps null: false
    end
  end
end
