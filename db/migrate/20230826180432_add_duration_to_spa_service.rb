class AddDurationToSpaService < ActiveRecord::Migration[7.0]
  def change
    add_column :spa_services, :duration, :integer, default: 30
  end
end
