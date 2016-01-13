require 'rails_helper'

RSpec.describe Company, type: :model do
  before { @company = FactoryGirl.build(:company) }

  subject { @company }

  describe "name" do
    it { is_expected.to have_db_column :name }
    it { is_expected.to respond_to :name }
  end

  describe "zip_code" do
    it { is_expected.to have_db_column :zip_code }
    it { is_expected.to respond_to :zip_code }
  end
end
