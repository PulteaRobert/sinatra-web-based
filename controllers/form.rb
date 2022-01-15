# frozen_string_literal: true

require "sinatra"
require "rspec"

get "/form" do
  @user_name = params["Username"]
  @password = params["Password"]

  @form_was_submitted = !@user_name.nil? || !@Password.nil?

  @user_name_error = nil
  @password_error = nil
  @correct_details = false

  if @form_was_submitted
    @user_name.strip!
    @password.strip!
    # If an user with this username exists
    if User.exist?(@user_name)
      # If the login details are correct
      User.login?(@user_name, @password) ? @correct_details = true : @password_error = false
    else
      @user_name_error = true
    end
  else
    # If user's inputs are empty, assign true to error for the empty field
    @user_name.nil? ? @user_name_error = true : @password_error = true
  end
end

post "/form" do
  if @correct_details
    # TODO
  end
end
