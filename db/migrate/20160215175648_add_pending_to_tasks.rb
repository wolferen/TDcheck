class AddPendingToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :pending, :integer
    
  end
end
