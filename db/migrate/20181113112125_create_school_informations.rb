class CreateSchoolInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :school_informations do |t|
      t.references :school, index: true, foreign_key: true
      t.string :strength
      t.string :boys
      t.string :girls
      t.string :location
      t.string :established_year

      t.timestamps
    end
  end
end
