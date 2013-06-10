class Shot < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_attached_file :audio  ,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"
end
