class SessionsController < ApplicationController
  def index
    @username = session[:username]
    @password = session[:password]
  end

  def set_session
    session[:username] = "tim"
    session[:password] = "masterQuaig"
  end

end
