class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    if params[:search].blank?
      @tweets = Tweet.all.order(created_at: :desc)
    else
      @tweets = Tweet.where("about LIKE ?", '%' + params[:search] + '%').order(created_at: :desc)
    end
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id

    if @tweet.save
      redirect_to tweets_path, notice: "投稿しました！"
    else
      render :new
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if tweet.user_id == current_user.id
      tweet.destroy
      redirect_to tweets_path, notice: "削除が完了しました"
    else
      redirect_to tweets_path, alert: "権限がありません"
    end
  end

  def show
    @tweet = Tweet.find(params[:id]) # この1行が必須です
  end

  private

  def tweet_params
    params.require(:tweet).permit(:title, :about, :category, :image, :video)
  end
end