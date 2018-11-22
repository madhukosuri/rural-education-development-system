class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :gender
      t.date :date_of_birth
      t.string :current_city
      t.integer :mobile_number
      t.string :father_name
      t.string :current_designation

      t.timestamps
    end
  end
end
