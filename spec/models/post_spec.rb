require 'spec_helper'

describe PostsController do

  # describe "#index" do

    # before do

      # @post = Post.create(:title => "test", :body => "1, 2, 3", :category => "general")
      # @post = Post.create(:title => "test", :body => "1, 2, 3", :category => "general")
      # @posts = Post.order("created_at desc").page(params[:page]).per(4)
      # @recent_posts = Post.order("created_at desc")
    # end

    # it "should order the posts by the date that they were created at" do

    # end

  # end

  # it "requires a title" do
    # post = Post.new(:title => nil)
    # post.should_not be_valid
  # end

  describe Post do

    it "requires a title" do
      post = Post.new :title => "Test Title"
      post.should be_valid
    end

  end

end

