module ApplicationHelper
  def session_button
    if logged_in?
      link_to 'LOG OUT', logout_path, class: 'nav-theme cat-margin', method: :delete
    else
      link_to 'LOG IN', login_path, class: 'nav-theme'
    end
  end

  def sign_up_link
    if logged_in?
      link_to 'CREATE A CATEGORY', new_category_path, html_options = { class: 'nav-theme cat-margin' }
    else
      link_to 'SIGN UP |', signup_path, html_options = { class: 'nav-theme' }
    end
  end

  def nav_menu(categories, option = {})
    category_links = ''

    if logged_in?
      category_links << content_tag(:li, link_to('WRITE AN ARTICLE', new_article_path, class: 'nav-theme cat-margin'),
                                    option)
    end

    categories.each do |category|
      category_links << content_tag(:li, link_to(category.name.upcase, category_path(category), html_options = { class: 'nav-theme cat-margin' }), option)
    end

    category_links.html_safe
  end
end
