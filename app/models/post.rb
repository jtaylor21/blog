class Post < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "640x640>" },
                    :bucket => 'blog_as3_vcabansag',
                    :s3_credentials => S3_CREDENTIALS
  
  def self.find_by_slug(slug)
   post_title = slug.gsub('-',' ') 
   post = Post.find_by_title(post_title) 
  end

  def slug
    self.title.gsub(' ', '-')
  end

end
