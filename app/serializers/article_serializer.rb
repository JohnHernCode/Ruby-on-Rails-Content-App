class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :author_id, :image

  def image
    return unless object.image.attached?

    {
      cloudinary: object.image.service_url
    }
  end
end
