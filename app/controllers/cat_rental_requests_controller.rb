class CatRentalRequestsController < ApplicationController
  def new
    render :new
  end

  def create
    @rental = CatRentalRequest.new(request_params)
    if @rental.save
      # redirect_to cats_url
      redirect_to cat_url(@rental.cat_id)
    else
      render json: @rental.errors.full_messages
    end
  end

  private

  def request_params
    params.require(:rent).permit(:cat_id, :start_date, :end_date)
  end
end
