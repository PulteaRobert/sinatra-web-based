get "/edit" do
  id = params["id"]
  @user = User[id] if User.id_exists?(id)
  erb :edit
end

post "/edit" do
  id = params["id"]

  if User.id_exists?(id)
    @user = User[id]
    @user.register_load(params)

    if @user.valid?
      @user.save_changes
      redirect "/mentee-homepage"
    end
  end

  erb :edit
end
