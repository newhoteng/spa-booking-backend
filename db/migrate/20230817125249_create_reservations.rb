class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.string :treatment
      t.text :description
      t.string :image
      t.integer :duration
      t.references :user, null: false, foreign_key: true
      t.references :spa_service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
