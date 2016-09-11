class Job < ApplicationRecord
  belongs_to :company
  belongs_to :category
  has_many :users
  validates :title, :location, :description, :category_id,  presence: true

  def expired?
    Time.now.to_date - created_at.to_date > 89
  end

  def recent?
    Time.now.to_date - created_at.to_date < 6
  end
end
