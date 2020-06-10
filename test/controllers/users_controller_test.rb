require "test_helper"

describe UsersController do
  describe "login" do
    it "can log in an existing user" do
      user = perform_login(users(:dan))

      must_respond_with :redirect
    end

    it "can log in a new user" do
      new_user = User.new(uid: "6789", username: "Anto", provider: "github", email: "anto@blahblahblah.org")

      expect {
      logged_in_user = perform_login(new_user)
      }.must_change "User.count", 1

      must_respond_with :redirect
  end



end
end