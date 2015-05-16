class CreateSliders < ActiveRecord::Migration
  def change
    create_table :sliders do |t|
      t.string :picture
      t.string :title
      t.text :comment
      t.string :logo
      t.text :content

      t.timestamps null: false
    end
  end
end
