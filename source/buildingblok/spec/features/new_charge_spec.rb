require 'rails_helper'

RSpec.describe 'New form', type: :feature, js: true do
  describe 'submit form' do
    it "creates new record" do
      load "#{Rails.root}/db/seeds.rb"
      visit charges_path
      click_link 'New Charge'
      select(Company.first.name, :from => 'charge_chargeable_id')
      fill_in('charge_amount', :with => '9.99')
      expect {
        click_button('Charge Customer')
        loop until page.evaluate_script('jQuery.active').zero?
      }.to change(Charge, :count).by(1)
    end
  end
end
