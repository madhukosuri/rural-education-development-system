class CreateSchoolStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :school_staffs do |t|
      t.string :name
      t.string :email
      t.integer :contact
      t.integer :year_of_experience
      t.string :specialist
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
