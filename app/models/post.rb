class Post < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "640x640>" },
                    :storage => :s3,
                    :bucket => Setting.find_by_name('s3_bucket').value,
                    :s3_credentials => {
                      :access_key_id => Setting.find_by_name('s3_access_key_id').value,
                      :secret_access_key => Setting.find_by_name('s3_secret_access_key').value
                    }

end
