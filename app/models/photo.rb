# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  caption        :text
#  comments_count :integer
#  image          :string
#  likes_count    :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  owner_id       :integer
#

class Photo < ApplicationRecord
  validates(:poster, { :presence => true })

  def define_photo_object_params
    photo_row = Photo.where({:id => self.id})[0]
    self.caption = photo_row.caption
    self.comments_count = photo_row.comments_count
    self.image = photo_row.image
    self.likes_count = photo_row.likes_count
    self.created_at = photo_row.created_at
    self.updated_at = photo_row.updated_at
    self.owner_id = photo_row.owner_id
  end

  def poster
    my_owner_id = self.owner_id

    matching_users = User.where({ :id => my_owner_id })

    the_user = matching_users.at(0)

    return the_user
  end

  def comments
    my_id = self.id

    matching_comments = Comment.where({ :photo_id => self.id })

    return matching_comments
  end

  def get_commenter_username(author_id)
    comment = Comment.new
    comment.author_id = author_id
    the_user = comment.commenter
    
    return the_user.username
  end 

  def likes
    my_id = self.id

    matching_likes = Like.where({ :photo_id => self.id })

    return matching_likes
  end

  def fans
    my_likes = self.likes
    
    array_of_user_ids = Array.new

    my_likes.each do |a_like|
      array_of_user_ids.push(a_like.fan_id)
    end

    matching_users = User.where({ :id => array_of_user_ids })

    return matching_users
  end

  def fan_list
    my_fans = self.fans

    array_of_usernames = Array.new

    my_fans.each do |a_user|
      array_of_usernames.push(a_user.username)
    end

    formatted_usernames = array_of_usernames.to_sentence

    return formatted_usernames
  end
end
