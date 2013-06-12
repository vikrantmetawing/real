class Storiess < ActiveRecord::Base
  attr_accessible :email, :image, :name, :phone, :story,:user_id
end
