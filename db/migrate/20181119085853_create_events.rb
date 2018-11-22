class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date_of_event
      t.string :plans
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
