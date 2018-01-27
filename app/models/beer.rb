class Beer < ApplicationRecord
  validates :name, presence: true

  has_attached_file :image,
    storage: :cloudinary,
    path: ':id/beer'

  validates_attachment :image,
    content_type: { content_type: "image/jpeg" },
    size: { in: 0..10.kilobytes }
end
