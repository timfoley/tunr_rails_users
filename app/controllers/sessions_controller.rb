class SessionsController < ApplicationController
  # def index
  #   @username = session[:username]
  #   @password = session[:password]
  # end
  #
  # def set_session
  #   session[:username] = "tim"
  #   session[:password] = "masterQuaig"
  # end

  def new
    @user = User.new
  end

  def create
    input_username = params[:user][:username]

    if User.exists?(username: input_username)
      @user = User.find_by(username: input_username)
      if @user.password === params[:user][:password]
        puts "YOU'RE SIGNED IN--HOORAY!"
        session[:user_id] = @user.id
        redirect_to root_path
      else
        puts "WRONG PASSWORD, DUMMY! "
        redirect_to new_session_path
      end

    else
      puts "THAT USER DOESn'TOEE IXISTETH, DUMMY!"
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    puts "YOUR'E SIGNED OUT!"
    redirect_to :root
  end
end
