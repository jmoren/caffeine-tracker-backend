class AddMaxPerDayToUserConfiguration < ActiveRecord::Migration[8.0]
  def change
    add_column :user_configurations, :max_per_day, :float
  end
end
