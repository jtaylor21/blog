class Post < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "640x640>" },
                    :storage => :s3,
                    :bucket => 'blog_as3_vcabansag',
                    :s3_credentials => Rails.root.join('config', 's3.yml')
end
