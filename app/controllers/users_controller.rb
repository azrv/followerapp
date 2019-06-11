class UsersController < ApplicationController
  before_action :render_auth_warning, unless: :user_signed_in?

  def index
    @current_user = current_user
    @users = get_users
  end

  def follow
    @user_id = params[:id]
    rel = current_user.follow(@user_id)
    @user = User.find(@user_id)
    if rel.persisted?
      respond_to do |format|
        format.js {
          flash.now[:alert] = "OK"
          render "follow_update"
        }
      end
    else
      flash.now[:alert] = "Error"
    end
  end

  def unfollow
    @user_id = params[:id]
    rel = current_user.unfollow(@user_id)
    @user = User.find(@user_id)
    if rel.destroyed?
      respond_to do |format|
        format.js {
          flash.now[:alert] = "OK"
          render "follow_update"
        }
      end
    else
      flash.now[:alert] = "Error"
    end
  end

  private
  def user_signed_in?
    cookies[:user_id].present?
  end

  def render_auth_warning
    @ids = User.select("id").limit(10).map{ |u| u.id }
    render :warning
  end

  def get_users
    User.includes(:group, :followers).limit(10).order('name ASC')
  end
end
