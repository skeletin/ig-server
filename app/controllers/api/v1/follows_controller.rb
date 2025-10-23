class Api::V1::FollowsController < ApplicationController


  private
  def follow_params
    params.require(:follow).permit(
      :follower_id,
      :followed_user_id
    )
  end
end