class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :find_bookmark
  helper_method :list_tags
  helper_method :tutorial_name

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_bookmark(id)
    current_user.user_videos.find_by(video_id: id)
  end

  # def list_tags(tutorials)
  #   tutorials.map do |tutorial|
  #     tutorial.tag_list
  #   end.flatten(1)
  # end

  def tutorial_name(id)
    Tutorial.find(id).title
  end
end
