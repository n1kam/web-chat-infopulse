class RegistrationController < ApplicationController
  def index
    @chat_user=ChatUser.new
    if session[:error]!=nil
      @error=session[:error]
      session[:error]=nil
    end
  end
  def create
    @new_user=ChatUser.new(registration_params)
    if @new_user.save
      redirect_to '/'
    else
      session[:error]= "Bad login"
      redirect_to registration_index_path
    end
  end
  def registration_params
    params.require(:chat_user).permit(:name, :login, :password)
  end
end

