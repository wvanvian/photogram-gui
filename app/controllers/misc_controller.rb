class MiscController < ApplicationController
  def homepage
    @all_users = User.all
    pp(@all_users)
    render({ :template => "misc_templates/home"})
  end
end
