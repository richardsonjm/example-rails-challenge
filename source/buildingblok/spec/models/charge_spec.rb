require 'rails_helper'

RSpec.describe Charge, type: :model do
  before { @user_charge = FactoryGirl.build(:user_charge) }

  subject { @user_charge }

  describe "chargeable" do
    it { is_expected.to have_db_column(:chargeable_id) }
    it { is_expected.to have_db_column(:chargeable_type) }
    it { is_expected.to belong_to(:chargeable) }
    it { is_expected.to validate_presence_of(:chargeable) }
  end

  describe "amount" do
    it { is_expected.to have_db_column(:amount) }
    it { is_expected.to respond_to :amount }
    it { is_expected.to validate_presence_of(:amount) }
  end

  describe "unique_code" do
    it { is_expected.to have_db_column(:unique_code) }
    it { is_expected.to respond_to :unique_code }
  end

  describe "paid" do
    it { is_expected.to have_db_column(:paid) }
    it { is_expected.to respond_to :paid }
  end

  describe "refunded" do
    it { is_expected.to have_db_column(:refunded) }
    it { is_expected.to respond_to :refunded }
  end

  describe "#set_unique_code" do
    context 'unique code does not exists' do
      before { @user_charge.unique_code = nil}

      it 'sets unique code if none exists' do
        expect {
          @user_charge.send(:set_unique_code)
        }.to change(@user_charge, :unique_code)
      end

      it 'calls #generate_unique_code' do
        expect(@user_charge).to receive(:generate_unique_code)
        @user_charge.send(:set_unique_code)
      end
    end

    context 'unique code already exists' do
      it 'does not change unique code' do
        expect {
          @user_charge.send(:set_unique_code)
        }.not_to change(@user_charge, :unique_code)
      end

      it 'does not call #generate_unique_code' do
        expect(@user_charge).not_to receive(:generate_unique_code)
        @user_charge.send(:set_unique_code)
      end
    end
  end

  describe "#globale_chargeable=" do
    it "assigns chargeable from globale id" do
      expect{
        @user_charge.global_chargeable = FactoryGirl.create(:user)
      }.to change(@user_charge, :chargeable)
    end
  end

  describe "#globale_chargeable" do
    it "return chargeable globale id" do
      expect(@user_charge.global_chargeable).to eq @user_charge.chargeable.to_global_id
    end
  end
end
