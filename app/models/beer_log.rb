class BeerLog < ApplicationRecord
	belongs_to :user
	belongs_to :beer

	validates :user_id, presence: true
	validates :beer_id, presence: true
	validates :quantity, presence: true
	validates :date, presence: true
end
