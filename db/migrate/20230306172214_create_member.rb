class CreateMember < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.integer :project_id
      t.integer :user_id
    end
  end
end
