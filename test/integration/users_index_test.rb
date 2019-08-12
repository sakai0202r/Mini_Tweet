require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user     = users(:test)
    @other_user = users(:test2)
  end

  test "index as admin including pagination and delete links" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_difference 'User.count', -1 do
      delete user_path(@other_user)
    end
  end
end
