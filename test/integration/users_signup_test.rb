require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  def setup
  	@user = User.new(name: "Example User", email: "user@example.com",
  										password: "foobar", password_confirmation: "foobar")
  end


  test "invalid signup information" do 
  	get signup_path
  	assert_no_difference 'User.count' do 
  		post users_path, params: { user: { name:  "", email: "user@invalid",
                                         password: "foo", password_confirmation: "bar" } }
    end
  end

  test "valid signup information" do 
  	get signup_path
  	assert_difference 'User.count', 1 do
  		post users_path, params: {user: {name: "Example Usertothemax", email: "hotuser@example.com",
  																		password: "password", password_confirmation: "password"}}
  	end
  	follow_redirect!
  	assert_template 'users/show'
    assert is_logged_in?
  end
end
