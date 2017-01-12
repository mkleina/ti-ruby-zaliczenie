class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.references :clinic
      t.string :test
      t.string :name
      t.string :surname
      t.string :phone

      t.timestamps
    end
  end
end
