class ActivitiesController < ApplicationController
  def index
    # データベースから全件取得する代わりに、分類ごとにデータを取得（または全件取得後にRubyで分類）
    
    # 【方法A: Rubyで分類（簡単）】
    all_activities = Activity.all
    @volunteer_activities = all_activities.select do |activity|
      activity.title.include?('ボランティア') || activity.details.include?('清掃')
    end
    
    @event_activities = all_activities.select do |activity|
      activity.title.include?('祭') || activity.details.include?('合宿')
    end
    
    # 注: この方法では、まだ「category」カラムがないため、キーワードに依存します。
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end