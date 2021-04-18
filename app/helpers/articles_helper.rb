require 'categories_helper'

module ArticlesHelper
  def featured_title(article)
    article.try(:title)
  end

  def featured_image(article)
    article.try(:image).try(:feature_show).try(:url)
  end

  def featured_content(article)
    article.try { |a| a.text.truncate(100, separator: ' ', omission: '.... (continued)') }
  end

  def number_of_votes(article)
    pluralize(article.votes.size, 'vote')
  end

  def author_name(article)
    article.user.name
  end

  def latest_article_background(category)
    category.articles.last.image.category_show.url.to_s.html_safe if category.articles.any?
  end

  def featured_title_link(article)
    link_to(featured_title(article), article_path(article), class: 'link-title underline') if article
  end

  def category_loop(categories)
    content_category = ''
    categories.each do |category|
      background = "background-image: url(#{latest_article_background(category)});"
      url = link_to category.name, category_path(category)
      content_category << content_tag(:div, class: 'category', style: background) do
        content_tag(:p, url) +
        content_tag(:span, category_article_link(category))
      end
    end
    content_category.html_safe
  end
end
