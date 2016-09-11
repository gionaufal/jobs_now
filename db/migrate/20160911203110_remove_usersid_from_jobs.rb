class RemoveUsersidFromJobs < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :users_id, :string
  end
end
