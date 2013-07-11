class Rebound < ActiveRecord::Base
  belongs_to :to_shot_id, :class_name => "Shot"
  belongs_to :from_shot_id, :class_name => "Shot"
end