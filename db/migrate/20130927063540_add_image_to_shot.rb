class AddImageToShot < ActiveRecord::Migration
  def change
  	add_attachment :shots, :shot_image
  end
end
