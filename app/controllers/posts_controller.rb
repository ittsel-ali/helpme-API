class PostsController < ApplicationController
  def create
    post = @visitor.posts.create(permit_params)

    render json: post.image.file_url
  end

  private

  def permit_params
    params.require(:post).permit(:text, :price, image_attributes: [:file])
  end

  def set_visitor
    @visitor = Visitor.find(params[:id])
  end
end
