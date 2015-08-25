class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  acts_as_voter

  has_many :comments, as: :authorable

  validates_presence_of :nickname


end
