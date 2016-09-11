class RemoveUsersFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :users, :string
  end
end
