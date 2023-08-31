class RemoveUserIdColumnFromSpaServices < ActiveRecord::Migration[7.0]
  def change
    remove_column :spa_services, :user_id, :bigint
  end
end
