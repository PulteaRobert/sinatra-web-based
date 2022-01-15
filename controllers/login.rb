get "/login" do
  redirect "/logout" if session[:logged_in]
  @user = User.new
  erb :login
end

post "/login" do
  @user = User.new
  @user.login_load(params)
  @error = nil

  if @user.login_exist?
    session[:logged_in] = true
    $login_user = User.find(user_name: @user.user_name)
      if @user.is_mentee?
          session[:mentee] = true
          redirect "mentee-homepage"
      elsif @user.is_mentor?
          session[:mentor] = true
          redirect "mentor-homepage"
      elsif @user.is_admin?
          session[:admin] = true
          redirect "admin-homepage"
      end

  else
    @error = "Username/Password combination incorrect"
  end
    erb :login
end

get "/logout" do
  session.clear
  erb :logout
end
