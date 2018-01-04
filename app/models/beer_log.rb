class BeerLog < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates :user_id, presence: true
  validates :beer_id, presence: true
  validates :quantity, presence: true
  validates :date, presence: true

  validate :is_future?

  def is_future?
    if date.present? && date > Date.today
      errors.add(:date, "can't be of the future, are you drunk?")
    end
  end

end
