class AddUsersToJobs < ActiveRecord::Migration[5.0]
  def change
    add_reference :jobs, :users, foreign_key: true
  end
end
