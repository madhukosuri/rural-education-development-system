class CreateAdmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :admissions do |t|
      t.string :year
      t.integer :boys
      t.integer :girls
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
