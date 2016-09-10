class User < ApplicationRecord
  has_many :jobs
  validates :name, :description, :github, :linkedin, :email, :phone, presence: true
end
