class Post < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  has_many :post_hash_tags
  has_many :hash_tags, through: :post_hash_tags

  validate :image_presence
  def image_presence
    errors.add(:image, "can't be blank") unless image.attached?
  end
  def extract_name_hash_tags
    description.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
  end
end