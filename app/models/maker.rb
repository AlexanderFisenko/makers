class Maker < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  acts_as_voter

  validates_presence_of :first_name, :last_name, :nickname

  has_many :videos, dependent: :destroy


  def name
    "#{first_name} #{last_name}"
  end
end
