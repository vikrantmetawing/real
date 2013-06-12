class AddContantProperties < ActiveRecord::Migration
  def up
  end

  def down
  end
  def change
add_column :properties, :contant, :string 
  end
end
