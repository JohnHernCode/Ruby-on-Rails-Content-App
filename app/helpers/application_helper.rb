# frozen_string_literal: true

module ApplicationHelper
  def session_button
    if logged_in?
      link_to "Log out", logout_path, class: "mx-2", method: :delete
    else
      link_to "Log in", login_path, class: "mx-2"
    end
  end
  
  def sign_up_link
    if logged_in?
    else
      link_to "Sign up", signup_path, class: "mx-2"
    end
  end
end
