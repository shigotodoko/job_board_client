require 'test_helper'

class PostTest < MiniTest::Test
  def test_find_all
    posts = Post.all

    refute_empty posts
  end

  def test_find_by_id
    post = Post.find_by_id(638)

    refute_nil post.id
    refute_nil post.title
    refute_nil post.location
    refute_nil post.description
    refute_nil post.status
    refute_nil post.created_at
    refute_nil post.active
  end
end
