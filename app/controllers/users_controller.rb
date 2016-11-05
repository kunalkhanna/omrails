class UsersController < ApplicationController
  def show
  	@user = User.find_by(username: params[:id])
  	@tweet = @user.tweets
  end
end
