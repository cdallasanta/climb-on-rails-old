module HeaderHelper
  def login_link_or_user_page
    if logged_in?
      "<div class=\"header-link\">
          #{link_to "Elements", elements_path}
        </div>
        <div class=\"header-link\">
        #{link_to "My profile", user_path(current_user)}
      </div>
      <div class=\"header-link\">
        #{link_to "Logout", logout_path}
      </div>".html_safe
    else
      "<div class=\"header-link\">
          #{link_to "Login", login_path}
      </div>".html_safe
    end
  end
end
