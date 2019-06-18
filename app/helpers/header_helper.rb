module HeaderHelper
  def login_link_or_user_page
    if logged_in?
      "<li class=\"nav-item\">
          #{link_to "Elements", elements_path, class: "nav-link", class: "nav-link"}
        </li>
        <li class=\"nav-item\">
        #{link_to "My profile", user_path(current_user), class: "nav-link"}
        </li>
        <li class=\"nav-item\">
        #{link_to "Logout", logout_path, class: "nav-link"}
        </li>
      ".html_safe
    else
      "<li class=\"nav-item\">
          #{link_to "Login", login_path, class: "nav-link"}
      </li>".html_safe
    end
  end
end
