class ChnageDatatype < ActiveRecord::Migration
  def up
  end

  def down
  end
  def change
	change_column :contactpeople, :phone, :string 
  end

end
