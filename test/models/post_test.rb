require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users(:test)
    @post = @user.posts.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "content should be present" do
    @post.content = "   "
    assert_not @post.valid?
  end

  test "content should be at most 50 characters" do
    @post.content = "a" * 51
    assert_not @post.valid?
  end
end
