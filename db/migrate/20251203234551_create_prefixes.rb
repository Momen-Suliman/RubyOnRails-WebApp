class CreatePrefixes < ActiveRecord::Migration[8.0]
  def change
    create_table :prefixes do |t|
      t.string :name

      t.timestamps
    end
  end
end
