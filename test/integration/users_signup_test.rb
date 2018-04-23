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

end
