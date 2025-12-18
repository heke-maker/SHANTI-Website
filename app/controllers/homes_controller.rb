class HomesController < ApplicationController
  def index
    # ここに追記：カレンダーに表示する全てのデータを取得する
    @blogs = Blog.all 
  end
end