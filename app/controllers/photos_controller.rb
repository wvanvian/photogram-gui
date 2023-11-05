class PhotosController < ApplicationController
  def details
    @photo = Photo.new
    @photo.id = params.fetch("path_id")
    @photo.define_photo_object_params

    render({ :template => "photos_templates/detail"})
  end

  def delete
    photo = Photo.new
    photo.id = params.fetch("path_id")
    photo.define_photo_object_params
    username = photo.get_commenter_username(photo.owner_id)

    @the_photo = Photo.find(photo.id)
    @the_photo.destroy

    redirect_to("/users/#{username}", { :notice => "Photo deleted successfully."} )
  end

  def create
    @the_comment = Comment.new
    @the_comment.photo_id = params.fetch("input_photo_id")
    @the_comment.author_id = params.fetch("input_author_id")
    @the_comment.body = params.fetch("input_comment")

    if @the_comment.valid?
      @the_comment.save
      redirect_to("/photos/#{@the_comment.photo_id}", { :notice => "Comment crated successfully."} )
    else
      redirect_to("/photos/#{@the_comment.photo_id}", { :alert => "Comment failed to create successfully." })
    end
  end

  def update
    photo_id = params.fetch("path_id")
    @photo = Photo.where({ :id => photo_id }).at(0)
    @photo.image = params.fetch("input_image")
    @photo.caption = params.fetch("input_caption")

    if @photo.valid?
      @photo.save
      redirect_to("/photos/#{photo_id}", { :notice => "Photo updated successfully."} )
    else
      redirect_to("/photos/#{photo_id}", { :alert => "Photo failed to update successfully." })
    end
  end

end
