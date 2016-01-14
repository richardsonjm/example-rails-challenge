class ChargesController < ApplicationController
  def index
    @failed_charges = Charge.where(paid: false)
    @disputed_charges = Charge.where(paid: true, refunded: true)
    @successful_charges = Charge.where(paid: true, refunded: false)
  end

  def show
    @charge = Charge.find_by(unique_code: params[:unique_code])
  end

  def new
    @charge = Charge.new
  end

  def create
    @charge = Charge.new(amount: charge_params[:amount], global_chargeable: charge_params[:chargeable_id])

    respond_to do |format|
      if @charge.save
        format.html { redirect_to charge_path(unique_code: @charge.unique_code), notice: 'charge was successfully created.' }
        format.json { render :show, status: :created, location: @charge }
      else
        format.html { render :new }
        format.json { render json: @charge.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def charge_params
      params[:charge].permit(:chargeable_id, :amount)
    end
  end
