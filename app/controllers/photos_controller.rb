class PhotosController < ApplicationController
  def details
    
    render({ :template => "photos_templates/detail"})
  end

end
