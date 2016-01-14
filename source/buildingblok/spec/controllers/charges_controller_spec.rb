require 'rails_helper'

RSpec.describe ChargesController, type: :controller do

  before { @charge = FactoryGirl.create(:user_charge, :successful)}

  describe "GET #index" do
    it "assigns all charges as @charges" do
      get :index
      expect(assigns(:successful_charges)).to eq([@charge])
    end
  end

  describe "GET #show" do
    it "assigns the requested charge as @charge" do
      get :show, {:id => @charge.to_param}
      expect(assigns(:charge)).to eq(@charge)
    end
  end

  describe "GET #new" do
    it "assigns a new charge as @charge" do
      get :new
      expect(assigns(:charge)).to be_a_new(Charge)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before do
        @valid_attributes = {
          chargeable_id: FactoryGirl.create(:user).to_global_id.to_s,
          amount: '9.99'
        }
      end

      it "creates a new charge" do
        expect {
          post :create, {:charge => @valid_attributes}
        }.to change(Charge, :count).by(1)
      end

      it "assigns a newly created Charge" do
        post :create, {:charge => @valid_attributes}
        expect(assigns(:charge)).to be_a(Charge)
        expect(assigns(:charge)).to be_persisted
      end

      it "assigns a newly created Charge to a User" do
        post :create, {:charge => @valid_attributes}
        expect(Charge.last.chargeable).to be_a(User)
      end

      it "redirects to the created charge" do
        post :create, {:charge => @valid_attributes}
        expect(response).to redirect_to(Charge.last)
      end
    end

    context "with invalid params" do
      before {@invalid_attributes = {chargeable_id: '', amount: '9.99'} }

      it "assigns a newly created but unsaved charge as @charge" do
        post :create, {:charge => @invalid_attributes}
        expect(assigns(:charge)).to be_a_new(Charge)
      end

      it "re-renders the 'new' template" do
        post :create, {:charge => @invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end
end
