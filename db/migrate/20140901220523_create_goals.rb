class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.integer :user_id, null: false
      t.string  :body, null: false
      t.integer :private, null: false
      t.timestamps
    end
  end
end
