class AddJobToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :job, foreign_key: true
  end
end
