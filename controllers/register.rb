get "/register" do
  @user = User.new
  erb :register
end

post "/register" do
  @user = User.new
  @user.register_load(params)
  @error = nil

  # rubocop:disable Lint/UselessAssignment
  username = params["user_name"]
  # rubocop:enable Lint/UselessAssignment
  if @user.valid?
    @user.save_changes
    redirect "/success"
  end

  erb :register
end
