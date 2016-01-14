class Company < ActiveRecord::Base
  has_many :charges, as: :chargeable
end
