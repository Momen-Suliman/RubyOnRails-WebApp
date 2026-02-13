class AddSectionNumberToSections < ActiveRecord::Migration[8.0]
  def change
    add_column :sections, :section_number, :string
  end
end
