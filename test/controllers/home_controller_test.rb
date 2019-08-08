require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Mini Tweet App"
  end

  test "should get root" do
   get root_url
   assert_response :success
 end

  test "should get home" do
    get home_home_url
    assert_response :success
    assert_select "title", "Mini Tweet | #{@base_title}"
  end

  test "should get about" do
    get home_about_url
    assert_response :success
    assert_select "title", "Mini Tweetとは | #{@base_title}"
  end
end
