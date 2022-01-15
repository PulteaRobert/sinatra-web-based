require "require_all"
require "bcrypt"
get "/admin-homepage" do
    if not session[:logged_in]
        redirect "/need-login"
    elsif not session[:admin]
        redirect "/no-permission"
    else
        @users = User.all
        @mentees = User.where(role: "mentee")
        @mentors = User.where(role: "mentor")
        erb :admin_homepage
    end
end