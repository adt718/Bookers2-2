class RelationshipsController < ApplicationController
  before_action :authenticate_user!




  def unfollow
  current_user.unfollow(params[:id])
  redirect_to root_path
  end

  def create
    # byebug
    @user = User.find(params[:user_id])
    if current_user!= @user
    current_user.follow(@user)
    end
    redirect_to request.referer
    # user = User.find(params[:follow_id])
    # following = current_user.follow(user)
    # if following.save
    #   flash[:success] = 'ユーザーをフォローしました'
    #   redirect_to user
    # else
    #   flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    #   redirect_to user
    # end
    # current_user.follow(params[:user_id])
    # redirect_to request.referer
  end


  def destroy
    @user = User.find(params[:user_id])
    current_user.unfollow(@user)
    redirect_to request.referer

    # user = User.find(params[:user_id])
    # following = current_user.unfollow(user)
    # if following.destroy
    #   flash[:success] = 'ユーザーのフォローを解除しました'
    #   redirect_to user
    # else
    #   flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
    #   redirect_to user
    # end
  end

end

