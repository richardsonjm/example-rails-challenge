require 'rails_helper'

RSpec.describe 'New form', type: :feature do
  describe 'submit form' do
    it "creates new record" do
      load "#{Rails.root}/db/seeds.rb"
      visit new_charge_path
      select(Company.first.name, :from => 'charge_chargeable_id')
      fill_in('charge_amount', :with => '9.99')
      expect {
        click_button('Charge Customer')
      }.to change(Charge, :count).by(1)
    end
  end
end
