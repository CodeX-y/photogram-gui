class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index" })
  end

  def show
    url_username = params.fetch("path_username")
    matching_username = User.where({ :username => url_username })

    @the_user = matching_username.first

    render({:template => "user_templates/show"})
  end

  def create
    username_input = params.fetch("the_username")
    new_user = User.new
    new_user.username = username_input
    new_user.save

    redirect_to("/users/"+ new_user.username)
  end

  def update
    the_username = params.fetch("update_username")
    matching_user = User.where( :username => the_username )
    the_user = matching_user.first
    the_user.username = params.fetch("input_username")

    the_user.save

    redirect_to("/users/#{the_user.username}")
  end
end
