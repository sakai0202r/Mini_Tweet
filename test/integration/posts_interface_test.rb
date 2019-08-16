require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:test)
  end

  test "post interface" do
    log_in_as(@user)
    get root_path
    # 無効な送信
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { content: "" } }
    end
    # assert_select 'div#error_explanation'
    # 有効な送信
    content = "test content."
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # 投稿を削除する
    assert_select 'a', text: '削除'
    first_post = @user.posts.first
    assert_difference 'Post.count', -1 do
      delete post_path(first_post)
    end
    # 違うユーザーのプロフィールにアクセス (削除リンクがないことを確認)
    get user_path(users(:test2))
    assert_select 'a', text: '削除', count: 0
  end
end
