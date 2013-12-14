class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :use_only_your_profile, except: [:show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to root_url
  end

  def show
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:city, :email, :phone, :first_name, :last_name)
    end

    def use_only_your_profile
      redirect_to root_path if current_user.id != params[:id].to_i
    end

end
