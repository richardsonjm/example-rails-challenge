class User < ActiveRecord::Base
  has_many :charges, as: :chargeable

  def name
    "#{first_name} #{last_name}"
  end
end
