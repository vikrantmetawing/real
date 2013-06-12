class User < ActiveRecord::Base
  attr_accessible :name, :password, :user_id,:email,:validate
end
