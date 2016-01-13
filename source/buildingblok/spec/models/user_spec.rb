require 'rails_helper'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }

  subject { @user }

  describe "first_name" do
    it { is_expected.to have_db_column :first_name }
    it { is_expected.to respond_to :first_name }
  end

  describe "last_name" do
    it { is_expected.to have_db_column :last_name }
    it { is_expected.to respond_to :last_name }
  end
end
