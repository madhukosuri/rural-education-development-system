class AddColumnToSchols < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :meo_contact_number, :string
    add_column :schools, :deo_contact_number, :string
  end
end
