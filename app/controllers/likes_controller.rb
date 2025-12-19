class LikesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    like = current_user.likes.create(tweet_id: params[:tweet_id])
    
    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.turbo_stream # これで瞬時に切り替わります
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    like = current_user.likes.find_by(tweet_id: params[:tweet_id])
    like.destroy

    respond_to do |format|
      format.html { redirect_back(fallback_location: root_path) }
      format.turbo_stream
    end
  end
end