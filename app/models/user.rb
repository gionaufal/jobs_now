class User < ApplicationRecord
  belongs_to :job
  validates :name, :description, :github, :linkedin, :email, :phone, presence: true
end
