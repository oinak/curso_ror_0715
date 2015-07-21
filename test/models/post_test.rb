require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "a new test" do
    post = Post.new

    assert !post.valid?, "a new post must not be valid"
    assert_equal false, post.save
    assert_raise(ActiveRecord::RecordInvalid){ post.save! }
  end

  test 'a post with no title' do
    valid_post = posts(:caracola)

    assert valid_post.valid?
    valid_post.title = nil
    assert_equal false, valid_post.valid?
  end

end
