class AddCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.string :user_id
      t.string :shot_id
      t.timestamps
    end
  end
end
