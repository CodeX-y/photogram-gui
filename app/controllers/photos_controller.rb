class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})
  
    render ({:template => "/photo_templates/index"})
  end

  def show
    url_id = params.fetch("path_id")
    matching_photos = Photo.where( :id => url_id)

    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show"})
  end

  def delete
    the_id = params.fetch("toast_id")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.at(0)
    the_photo.destroy

    redirect_to("/photos")
  end

  # def add_comment
  #   photo_id_input= params.fetch("the_photo_id")
  #   author_id_input = params.fetch("the_author_id")
  #   comment_input = params.fetch("the_comment")
  
  #   new_comment = Comment.new

  #   new_comment.photo_id = photo_id_input
  #   new_comment.author_id = author_id_input
  #   new_comment.body = comment_input

  #   new_comment.save

  #   matching_photos = Photo.where({:id => photo_id_input})

  #   the_photo = matching_photos.at(0)

  #   redirect_to("/photos/" + the_photo.id.to_s)
  # end


  # def update
  #   the_id = params.fetch("modify_id")
  #   image = params.fetch("the_new_image")
  #   caption = params.fetch("the_new_caption") 

  #   matching_photos = Photo.where({:id => the_id})

  #   the_photo = matching_photos.at(0)

  #   the_photo.image = image
  #   the_photo.caption = caption

  #   the_photo.save

  #   redirect_to("/photos/" + the_photo.id.to_s)
  # end

  # def create
  #   input_image = params.fetch("the_image")
  #   input_caption = params.fetch("the_caption")
  #   input_owner_id = params.fetch("the_owner")

  #   new_photo = Photo.new 

  #   new_photo.image = input_image
  #   new_photo.caption = input_caption
  #   new_photo.owner_id = input_owner_id

  #   new_photo.save

  #   redirect_to("/photos/" + new_photo.id.to_s)
  # end
end
