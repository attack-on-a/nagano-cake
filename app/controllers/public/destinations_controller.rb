class Public::DestinationsController < ApplicationController
  def index

    @destination = Destination.new
    @destinations = Destination.where(customer_id: current_customer)
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def create
    @destination = Destination.new(destination_params)
    @destination.customer_id = current_customer
    if @destination.save
      redirect_to  destination_path
    else
      render :index
    end
  end

  def update
    @destination = Destination.find(params[:id])
    @destination.update(destination_params)
    redirect_to destination_path
  end

  def destroy
  end

 private
  def destination_params
    params.require(:destination).permit(:post_code, :address, :name)
  end

end
