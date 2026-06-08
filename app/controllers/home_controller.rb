class HomeController < ApplicationController
  def index
    if user_signed_in?
     @diaries = current_user.diaries.order(created_at: :desc)
    else
     @diaries = Diary.none
    end
  end

end