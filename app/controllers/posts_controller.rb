class PostsController < ApplicationController
  before_action :set_visitor

  def create
    post = @visitor.posts.create(permit_params)

    render json: post.image.file_url(:mobile)
  end

  private

  def permit_params
    params.require(:post).permit(:text, :price, image_attributes: [:file])
  end

  def set_visitor
    @visitor = current_user.try(:user_locations).try(:first).try(:visitors).try(:where, active?: true).try(:first)
  end
end
