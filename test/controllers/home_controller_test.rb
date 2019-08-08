require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Mini Tweet"
  end

  test "should get root" do
   get root_url
   assert_response :success
 end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "#{@base_title}とは | #{@base_title}"
  end
end
