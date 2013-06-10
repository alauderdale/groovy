class AddAttachmentAudioToShots < ActiveRecord::Migration
  def change
    change_table :shots do |t|
      t.attachment :audio
    end
  end
end
