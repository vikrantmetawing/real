class AddToProperties < ActiveRecord::Migration
  def up
  end

  def down
  end
  def change
add_column :properties, :sub_property_type, :string 
  end
end
