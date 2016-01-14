class ChargesController < ApplicationController
  before_action :set_charge, only: [:show, :edit, :update, :destroy]

  def index
    @charges = Charge.all
  end

  def show
  end

  def new
    @charge = Charge.new
  end

  def create
    @charge = Charge.new(amount: charge_params[:amount], global_chargeable: charge_params[:chargeable_id])

    respond_to do |format|
      if @charge.save
        format.html { redirect_to @charge, notice: 'charge was successfully created.' }
        format.json { render :show, status: :created, location: @charge }
      else
        format.html { render :new }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_charge
      @charge = Charge.find(params[:id])
    end

    def charge_params
      params[:charge].permit(:chargeable_id, :amount)
    end
  end
