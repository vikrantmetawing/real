class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties, :primary_key => :property_id do |t|
	  t.integer :property_id
      t.string :property_name
      t.integer :price
      t.string :state
      t.string :property_type
      t.string :purpose
      t.integer :bedroom
      t.string :image

      t.timestamps
    end
  end
end
