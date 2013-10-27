class ChangeBioText < ActiveRecord::Migration
  def up
  	change_column :users, :bio, :text
  end
end
