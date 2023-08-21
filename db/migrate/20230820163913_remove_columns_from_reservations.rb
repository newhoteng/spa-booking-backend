class RemoveColumnsFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :treatment, :string
    remove_column :reservations, :description, :text
    remove_column :reservations, :image, :string
    remove_column :reservations, :duration, :integer
  end
end
