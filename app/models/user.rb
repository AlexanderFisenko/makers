class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :validatable

  acts_as_voter

  validates_presence_of :nickname


end
