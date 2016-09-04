class Job < ApplicationRecord
  belongs_to :company
  validates :title, :category, :location, :description,  presence: true
end
