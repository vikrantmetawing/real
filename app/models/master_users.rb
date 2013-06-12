class MasterUsers < ActiveRecord::Base
  attr_accessible :master_email, :master_user_id, :password, :shop_name, :validate
end
