class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :code
      t.string :current_strength
      t.integer :current_staff
      t.integer :current_issues
      t.timestamps
    end
  end
end
