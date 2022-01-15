require "require_relative"
require_relative "helper_spec"

RSpec.describe MentorPairing do
  describe "mentor?" do
    context "when given an user that exists and has a mentor" do
      it "returns true" do
        expect(described_class.mentor?("mentee1")).to eq(false)
      end
    end

    context "when given an user that doesn't exist and has a mentor" do
      it "raises a user does not exist error" do
        expect do
          described_class.mentor?("mentee17")
        end.to raise_error("User does not exist")
      end
    end

    context "when given an user that exists, but does not have mentor" do
      it "raises This user does not have a mentor error" do
        expect(described_class.mentor?("mentee2")).to eq(false)
      end
    end
  end

=begin

  describe "mentor_available?" do
    context "see if there is a mentor available in the DB" do
      it "returns true / false" do
        expect(described_class.mentors_available).to eq()
      end
    end
  end

  describe "mentors_available" do
    context "lists all the mentors available in the DB" do
      it "returns a hash with all the mentors available" do
        expect(described_class.mentors_available.nil?).to eq(false)
      end
    end
  end
=end

end