class PostsController < ApplicationController
  before_action :doorkeeper_authorize!

  def create
    post = Post.new(permit_params)
    post.save!(validate: false)

    render json: post.image.file_url(:small)
  end

  private

  def permit_params
    params.require(:post).permit(:text, :price, image_attributes: [:file])
  end
end
