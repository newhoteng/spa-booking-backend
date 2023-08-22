class AddIsRemovedToSpaServices < ActiveRecord::Migration[7.0]
  def change
    add_column :spa_services, :is_removed, :boolean, default: false
  end
end
