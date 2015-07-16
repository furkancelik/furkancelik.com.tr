class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :title
      t.string :description
      t.string :keywords
      t.string :fb_account
      t.string :tw_account
      t.string :git_account
      t.string :footer

      t.timestamps null: false
    end
  end
end
