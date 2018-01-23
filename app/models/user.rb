class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :beer_logs
  has_many :beers, through: :beer_logs

  before_create :set_default_role

  private

  def set_default_role
    self.add_role 'beer_lover'
  end
end