module PostsHelper

  def link_to_comments(post)
    count = post.comments.count
    text  = "tiene #{count} comentario#{count == 1 ? '': 's'}"

    link_to(text, post_comments_path(post))
  end

end
