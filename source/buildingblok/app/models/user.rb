class User < ActiveRecord::Base
  has_many :charges, as: :chargeable
end
