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
    the_id = params.fetch("path_id")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.at(0)
    the_photo.destroy

    redirect_to("/photos")
  end

  def create
    new_photo = Photo.new

    new_photo.image = params.fetch("the_image")
    new_photo.caption = params.fetch("the_caption")
    new_photo.owner_id = params.fetch("the_owner")

    new_photo.save

    new_photo_id = new_photo.id

    redirect_to("/photos/#{new_photo_id}")
  end

  def update
    the_id = params.fetch("path_id")
    matching_photo = Photo.where( :id => the_id)
    the_photo = matching_photo.at(0)
    
    the_photo.image = params.fetch("the_new_image")
    the_photo.caption = params.fetch("the_new_caption")

    the_photo.save

    redirect_to("/photos/#{the_photo.id}")
  end

  def add_comment
    the_id = params.fetch("path_id")
    new_comment = Comment.new
    
    new_comment.photo_id = params.fetch("path_id")
    new_comment.body = params.fetch("the_comment")
    new_comment.author_id = params.fetch("the_author_id")

    new_comment.save
    
    redirect_to("/photos/#{the_id}")
  end
end
