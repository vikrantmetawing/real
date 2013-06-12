class CreateAdminlogins < ActiveRecord::Migration
  def change
    create_table :adminlogins do |t|
      t.string :loginid
      t.string :password

      t.timestamps
    end
  end
end
