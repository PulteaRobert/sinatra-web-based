post "/match" do
    id = params["id"]
    if User.id_exists?(id)
        $login_user.matched_id = id
        $login_user.save_changes
        redirect "/mentee-homepage"
    end
    
    erb :match
end