module PostsHelper
  def build_comments(post)

    if post.comments.empty?
      return "<strong>No comments yet.</strong>".html_safe
    end

    built_comments = ''

    if current_page?(user_post_path(post.author, post))
      post.comments.each do |comment|
        built_comments += "<strong>#{User.find(comment.user_id).name}:</strong> #{comment.content}<br>"
      end
    else
      post.recent_comments.each do |comment|
        built_comments += "<strong>#{User.find(comment.user_id).name}:</strong> #{comment.content}<br>"
      end
    end

    built_comments.html_safe
  end
end
