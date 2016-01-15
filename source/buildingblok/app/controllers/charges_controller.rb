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
    @charge = Charge.new(
      amount: charge_params[:amount],
      global_chargeable: charge_params[:chargeable_id],
      paid: false,
      refunded: false
    )
    @charge.save
  end

  private
    def charge_params
      params[:charge].permit(:chargeable_id, :amount)
    end
  end
