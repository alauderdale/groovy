class Shot < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :rebounds, :class_name => "Rebound", :foreign_key => "from_shot_id", :dependent => :destroy
  has_many :reverse_rebounds, :class_name => "Rebound",
      :foreign_key => "to_shot_id", :dependent => :destroy
  has_many :shots, :through => :rebounds, :source => :to_shot
  has_attached_file :audio  ,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"
  validates_attachment_content_type :audio, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio', 'audio/x-m4a' ]
  has_attached_file :shot_image, :styles => { :medium => "88x88#", :thumb => "16x16#" }, :default_url => "/images/:style/missing_avatar.png"
  acts_as_taggable
  acts_as_votable
  validates_attachment_size :audio, :less_than => 560760.bytes
  self.per_page = 12
end