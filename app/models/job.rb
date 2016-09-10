class Job < ApplicationRecord
  belongs_to :company
  belongs_to :category
  validates :title, :location, :description, :category_id,  presence: true

  def expired?
    Time.now.to_date - created_at.to_date > 88
  end
end
