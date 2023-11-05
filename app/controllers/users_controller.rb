class UsersController < ApplicationController
  def details
    user_params =  User.all.where({:username => params.fetch("path_id")})[0]
    @user = User.new
    @user.id = user_params.id
    @user.username = user_params.username
    @user.private = user_params.private
    @user.likes_count = user_params.likes_count
    @user.comments_count

    render({ :template => "users_templates/detail"})
  end

  def create
    @the_user = User.new
    @the_user.username = params.fetch("input_username")

    if @the_user.valid?
      @the_user.save
      redirect_to("/users/#{@the_user.username}", { :notice => "User crated successfully."} )
    else
      redirect_to("/users/#{@the_user.username}", { :alert => "User failed to create successfully." })
    end
  end

  def update
    user_id = params.fetch("path_id")
    new_username = params.fetch("input_username")
    @user = User.where({ :id => user_id }).at(0)
    @user.username = new_username

    if @user.valid?
      @user.save
      redirect_to("/users/#{new_username}", { :notice => "User updated successfully."} )
    else
      redirect_to("/users/#{new_username}", { :alert => "User failed to update successfully." })
    end
  end
end
