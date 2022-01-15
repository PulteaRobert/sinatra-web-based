post "/delete" do
  id = params["id"]

  if User.id_exists?(id)
    user = User[id]
    user.delete
    redirect "/invalid-account"
  end

  erb :delete
end