module HeaderHelper
  def header_buttons
    if user_signed_in?
      "<div class='nav-item'>
          #{link_to "Elements", elements_path, class: "nav-link"}
        </div>
        <div class='nav-item'>
          #{link_to "My profile", user_path(current_user), class: "nav-link"}
        </div>
        <div class='nav-item'>
          #{link_to "Logout", destroy_user_session_path, method: :delete, class: "nav-link"}
        </div>
      ".html_safe
    end
  end
end
