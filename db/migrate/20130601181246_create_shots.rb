class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.timestamps
    end
  end
end
