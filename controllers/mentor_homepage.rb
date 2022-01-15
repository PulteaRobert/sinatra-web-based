require "require_all"
require "bcrypt"
get "/mentor-homepage" do
    if not session[:logged_in]
        redirect "/need-login"
    elsif not session[:mentor]
        redirect "/no-permission"
    else
        @matched_mentees = User.where(matched_id: $login_user.id)
        erb :mentor_homepage
    end
end