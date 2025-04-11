class CreateDrinks < ActiveRecord::Migration[8.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :description
      t.float :size
      t.float :caffeine
      t.string :image_url

      t.timestamps
    end
  end
end
