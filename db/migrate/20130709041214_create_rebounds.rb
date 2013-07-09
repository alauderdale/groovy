class CreateRebounds < ActiveRecord::Migration
  def change
    create_table :rebounds do |t|
      t.integer :from_shot
      t.integer :to_shot
      t.timestamps
    end
  end
end
