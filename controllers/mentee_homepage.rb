require "require_all"
require "bcrypt"
get "/mentee-homepage" do
    if not session[:logged_in]
        redirect "/need-login"
    elsif not session[:mentee]
        redirect "/no-permission"
    else
        @mentors = User.where(role: "mentor")
        @matched_mentor = User.find(id: $login_user.matched_id)
        erb :mentee_homepage
    end
end