class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.text :title
      t.integer :priority
      t.datetime :created_at
      t.datetime :started_at
      t.datetime :updated_at
      t.datetime :completed_at
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
