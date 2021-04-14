module ApplicationHelper
  def session_button
    if logged_in?
      link_to 'Log out', logout_path, method: :delete
    else
      link_to 'Log in', login_path
    end
  end

  def sign_up_link
    if logged_in?
      link_to 'Create a Category', new_category_path
    else
      link_to 'Sign up', signup_path
    end
  end

  def nav_menu(categories)
    category_links = ''

    if logged_in?
      category_links << content_tag(:li, link_to('WRITE AN ARTICLE', new_article_path, class: 'nav-theme cat-margin'))
    end

    categories.each do |category|
      category_links << content_tag(:li, link_to(category.name.capitalize, category_path(category), html_options = {class: 'nav-theme cat-margin'}))
    end

    category_links.html_safe
  end
end
