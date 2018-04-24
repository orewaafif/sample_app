require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "foo@bar.com",
                                         password: "foo",
                                         password_confirmation: "bar"} }

    end
    assert_template 'users/new'
  end #end of test "invalid signup information"

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "Example User",
                                         email: "example@tutorial.org",
                                         password: "foobar",
                                         password_confirmation: "foobar"} }

    end
    follow_redirect!
    assert_template 'users/show'
  end

end