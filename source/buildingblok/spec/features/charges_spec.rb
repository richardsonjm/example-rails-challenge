require 'rails_helper'

RSpec.describe 'Charges index', type: :feature do
  before do
    load "#{Rails.root}/db/seeds.rb"
    visit charges_path
  end

  describe 'displays different charge types' do
    it "lists failed" do
      within(find('.failed-charges')) {
        expect(page).to have_content 'Failed Charges'
        expect(all('tr.charge').count).to be 5
      }
    end

    it "lists disputed" do
      within(find('.disputed-charges')) {
        expect(page).to have_content 'Disputed Charges'
        expect(all('tr.charge').count).to be 3
      }
    end


    it "lists successuful" do
      within(find('.successful-charges')) {
        expect(page).to have_content 'Successful Charges'
        expect(all('tr.charge').count).to be 13
      }
    end
  end
end
