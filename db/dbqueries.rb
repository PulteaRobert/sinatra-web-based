require "sequel"
require "logger"
require "bcrypt"
require "require_relative"
require_relative "db"
include BCrypt

# User wrapper for the user table in DB.
class User < Sequel::Model(:users)
  # if an user exists
  # @returns true / false
  def self.exist?(user)
    !User.find(user_name: user).nil?
  end
        
  # if the login details are correct
  # @return true / false
  def self.login?(user, pass)
    return false unless User.exist?(user)

    entry = User.find(user_name: user)
    BCrypt::Password.new(entry.password) == pass
  end

  # adds an user
  def self.add(user, pass, role, email, mentor = nil)
    # If the user is in the DB, crash the program
    raise "User already exists with this name" if User.find(user_name: user)

    entry = User.new
    entry.user_name = user
    entry.password = BCrypt::Password.create(pass)
    entry.role = role
    entry.email = email
    entry.mentor = mentor
    entry.save_changes
  end

  # update the password
  def self.update_pass(user, pass)
    entry = User.find(user_name: user)
    raise "User does not exist" if entry.nil?
    raise "New password must be different from old password" if BCrypt::Password.new(entry.password) == pass

    entry.password = BCrypt::Password.create(pass)
    entry.save_changes
  end

  # updates the email
  def self.update_email(user, email)
    entry = User.find(user_name: user)
    raise "User does not exist" if entry.nil?
    raise "New email must be different from old email" if entry.email == email

    entry.email = email
    entry.save_changes
  end

  # deletes an user
  def self.delete(user)
    entry = User.find(user_name: user)
    raise "User does not exist" if entry.nil?

    User.find(user_name: user).delete
  end

  def self.id_exists?(id)
    return false if id.nil?
    return false if User.find(id: id).nil?

    true # all checks are ok - the id exists
  end

  def register_load(params)
    self.user_name = params.fetch("username", "").strip
    self.email = params.fetch("email", "").strip
    self.password = params.fetch("password", "").strip
    self.role = params.fetch("role", "").strip
  end
    
  def login_load(params)
    self.user_name = params.fetch("username", "").strip
    self.password = params.fetch("password", "").strip
    self.email = params.fetch("username", "").strip
  end
    
  def mentee_info_load(params)
    self.user_name = params.fetch("username", "").strip
    self.email = params.fetch("username", "").strip
    self.matched_mentor = params.fetch("username", "").strip
      
  end
    
  def register_validate
    super
    errors.add("username", "cannot be empty") if !user_name || user_name.empty?
    errors.add("password", "cannot be empty") if !password || password.empty?
    errors.add("email", "cannot be empty") if !email || email.empty?
    errors.add("role", "cannot be empty") if !role || role.empty?
  end
    
  def login_validate
    super
    errors.add("username", "cannot be empty") if !user_name || user_name.empty?
    errors.add("password", "cannot be empty") if !password || password.empty?
  end

  def login_exist?
    other_user = User.first(user_name: user_name)
    !other_user.nil? && other_user.password == password
  end
    
  def is_mentee?
    other_user = User.first(user_name: user_name)
    !other_user.nil? && other_user.role == "mentee"
  end
      
  def is_mentor?
    other_user = User.first(user_name: user_name)
    !other_user.nil? && other_user.role == "mentor"
  end
      
  def is_admin?
    other_user = User.first(user_name: user_name)
    !other_user.nil? && other_user.role == "admin"
  end
  
end
