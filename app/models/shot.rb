class Shot < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_and_belongs_to_many :rebounds
  WillPaginate.per_page = 5
  has_attached_file :audio  ,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"
  validates_attachment_content_type :audio, :content_type => [ 'audio/mpeg', 'audio/x-mpeg', 'audio/mp3', 'audio/x-mp3', 'audio/mpeg3', 'audio/x-mpeg3', 'audio/mpg', 'audio/x-mpg', 'audio/x-mpegaudio', 'audio/x-m4a' ]
  acts_as_taggable
  validates_attachment_size :audio, :less_than => 260760.bytes
end
