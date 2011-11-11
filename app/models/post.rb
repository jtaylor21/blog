class Post < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "640x640>" }

end
