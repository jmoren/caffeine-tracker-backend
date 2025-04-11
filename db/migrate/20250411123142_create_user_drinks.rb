class CreateUserDrinks < ActiveRecord::Migration[8.0]
  def change
    create_table :user_drinks do |t|
      t.references :drink, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :level
      t.datetime :consumed_at

      t.timestamps
    end
  end
end
