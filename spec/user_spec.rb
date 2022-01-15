require "require_relative"
require_relative "helper_spec"

puts User.all.inspect

RSpec.describe User do
  describe "#self.exist?" do
    context "when given a name mentee1 that exist" do
      it "returns true" do
        expect(described_class.exist?("mentee3")).to eq(true)
      end
    end

    context "when given a name test3 that doesnt exist" do
      it "returns false" do
        expect(described_class.exist?("test3")).to eq(false)
      end
    end

    describe "#self.login?" do
      context "when given correct login details" do
        it "returns true" do
          expect(described_class.login?("mentee3", "mentee3")).to eq(true)
        end
      end

      context "when given incorrect login details" do
        it "returns false" do
          expect(described_class.login?("Tony", "Kc5Wd4b6")).to eq(false)
        end
      end
    end

    describe "#self.add" do
      context "when given the user details of an already existing user" do
        it "raises the error that the a user with that name already exists" do
          expect do
            described_class.add("mentee3", "mentee3", "test", "test", "test")
          end.to raise_error("User already exists with this name")
        end
      end

      context "when given the new user detail" do
        it "add the user in db" do
          described_class.add("Paul", "Paul123456", "role1", "Paul123@sheffield.ac.uk", "mentor1")
          expect(described_class.login?("Paul", "Paul123456")).to be true
          described_class.delete("Paul")
        end
      end
    end

    describe "#self.update_pass" do
      context "when given the detail that the user does not exist" do
        it "raises an user does not exist error" do
          expect  do
            described_class.update_pass("MikeyMouse", "123456")
          end.to raise_error("User does not exist")
        end
      end

      context "when given the password with no difference than the old one" do
        it "raises an error that new password must be different from old password" do
          expect do
            described_class.update_pass("mentee3", "mentee3")
          end.to raise_error("New password must be different from old password")
        end
      end

      context "when given the valid user and new password " do
        it "update the new password in db" do
          described_class.update_pass("mentee3", "mentee2")
          expect(described_class.login?("mentee3", "mentee2")).to eq(true)
          described_class.update_pass("mentee3", "mentee3")
        end
      end
    end
  end

  describe "#self.update_email" do
    context "when given an user does not exist" do
      it "raises an error that user does not exist" do
        expect do
          described_class.update_email("MikeyMouse", "NewEmail123@sheffield.ac.uk")
        end.to raise_error("User does not exist")
      end
    end

    context "when given an email that is the same as the old one" do
      it "raises an error that new email must be different from old email" do
        expect do
          described_class.update_email("mentee3", "email1")
        end.to raise_error("New email must be different from old email")
      end
    end

    context "when given the valid user and new email " do
      it "update the new email in db" do
        described_class.update_email("mentee3", "234@sheffield.ac.uk")
        result = described_class.find(user_name: "mentee3", email: "234@sheffield.ac.uk").nil?
        expect(result).to be false
        described_class.update_email("mentee3", "email1")
      end
    end
  end
end
