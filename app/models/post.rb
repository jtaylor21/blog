class Post < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "640x640>" },
                    :bucket => 'blog_as3_vcabansag',
                    :s3_credentials => S3_CREDENTIALS

  def generate_permalink
    self.permalink = CGI.escape(self.permalink? ? self.permalink : self.title).downcase.gsub('+', '-')
  end

end
