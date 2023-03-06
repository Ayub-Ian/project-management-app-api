class CreateProject < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :status
      t.timestamps
      t.string :category
      t.datetime :due_date
      t.text :priority
      t.integer :user_id
    end
  end
end
