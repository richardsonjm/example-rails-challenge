# 1 Company with 5 successful charges
company1 = FactoryGirl.create(:company)
FactoryGirl.create_list(:company_charge, 5, :successful, chargeable: company1)

# 1 Company with 3 successful charges and 1 disputed charge and 1 failed charge
company2 = FactoryGirl.create(:company)
FactoryGirl.create_list(:company_charge, 3, :successful, chargeable: company2 )
FactoryGirl.create(:company_charge, :disputed, chargeable: company2)
FactoryGirl.create(:company_charge, :failed, chargeable: company2)

# 5 Users with 1 successful charge each
users = FactoryGirl.create_list(:user, 5)
users.each do |user|
  FactoryGirl.create(:user_charge, :successful, chargeable: user)
end

# 1 User with 2 disputed charges and 1 failed charge
user6 = FactoryGirl.create(:user)
FactoryGirl.create_list(:user_charge, 2, :disputed, chargeable: user6)
FactoryGirl.create(:user_charge, :failed, chargeable: user6)

# 1 User with 3 failed charges
user7 = FactoryGirl.create(:user)
FactoryGirl.create_list(:user_charge, 3, :failed, chargeable: user7)
