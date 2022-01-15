require_relative "../db/dbqueries"

# In order to further simplify the database if a mentor has in User.mentor id 1 that means
# that he is accepting mentees at the moment, but if it has id 0 he is not accepting mentees

# Further improvement of the User MVC - provides helpful methods for views
class MentorPairing < User
  def self.mentor?(user)
    entry = User.find(user_name: user)
    raise "User does not exist" if entry.nil?

    mentor = User.find(id: entry.mentor)
    return false if entry.mentor.nil? || mentor.nil? || mentor.role != "mentor"

    true
  end

  def self.mentor_available?
    entries = User.where(role: "mentor")
    return false if entries.empty? || entries.nil? || !entries.value?(1)

    true
  end

  def self.mentors_available
    return nil unless User.mentor_available?

    User.where(role: "mentor", mentor: 1)
  end

  def self.set_mentor(user, mentor_id)
    mentee = User.find(user_name: user)
    raise "User does not exist" if entry.nil?

    mentor = User.find(id: mentor_id)
    raise "Mentor does not exist" if mentor.nil?
    raise "This mentee already has this mentor" if mentee.mentor == mentor_id
    raise "This mentor does not accept anymore mentees" if mentor.mentor != 1

    mentee.mentor = mentor_id
    mentee.save_changes
  end
end
