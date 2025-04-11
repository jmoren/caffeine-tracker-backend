class CreateUserConfigurations < ActiveRecord::Migration[8.0]
  def change
    create_table :user_configurations do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :prefered_unit
      t.float :threshold

      t.timestamps
    end
  end
end
