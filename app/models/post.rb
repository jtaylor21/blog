class Post < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "640x640>" },
                    :storage => :s3,
                    :bucket => 'blog_as3_vcabansag',
                    :s3_credentials => {
                      :access_key_id => 'AKIAJ37JWBBNXXWMGMMQ',
                      :secret_access_key => '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'
                    }



end
