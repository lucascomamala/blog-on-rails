module UsersHelper
  def render_type(user)
    if current_page?(users_path)
      link_to(image_tag(user.photo || "default-user.png", class: "user-img"), user)
    else
      image_tag(user.photo || "default-user.png", class: "user-img")
    end
  end
end
