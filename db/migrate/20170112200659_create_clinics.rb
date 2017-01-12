class CreateClinics < ActiveRecord::Migration[5.0]
  def change
    create_table :clinics do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :phone

      t.timestamps
    end
  end
end
