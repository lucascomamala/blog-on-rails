module PostsHelper
  def post_render_type(post)
    if current_page?(user_post_path(post.author, post))
      "<h4 class='display-6 inline'>#{post.title}</h4> by #{link_to(post.author.name, @user,
                                                                    class: 'inline')}".html_safe
    else
      link_to(content_tag(:h4, post.title, class: 'display-6'), "posts/#{post.id}")
    end
  end

  def render_like_btn(post)
    return unless current_page?(user_post_path(post.author, post))

    return if !user_signed_in?

    pre_like = @post.likes.find { |like| like.user_id == current_user.id }
    if pre_like
      button_to(image_tag('heart-solid.svg', width: 30), user_post_like_path(@user, post, pre_like), method: :delete,
                                                                                                     class: 'like-btn')
    else
      button_to(image_tag('heart-regular.svg', width: 30), user_post_likes_path(@user, post, @like), method: :post,
                                                                                                     class: 'like-btn')
    end
  end

  def build_comments(post)
    return '<strong>No comments yet.</strong>'.html_safe if post.comments.empty?

    built_comments = ''

    if current_page?(user_post_path(post.author, post))
      post.comments.each do |comment|
        built_comments += "<strong>#{User.find(comment.author_id).name}:</strong> #{comment.text}<br>"
      end
    else
      post.recent_comments.each do |comment|
        built_comments += "<strong>#{User.find(comment.author_id).name}:</strong> #{comment.text}<br>"
      end
    end

    built_comments.html_safe
  end
end
