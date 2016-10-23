class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save!
      flash[:notice] = "Added friend"
      redirect_to users_path
    else
      flash[:error] = "Cannot add friend"
      redirect_to users_path
    end
  end
end
