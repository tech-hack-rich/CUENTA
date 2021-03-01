class MovementsController < ApplicationController

  def create
    @movement = Movement.new(movement_params)
    if @movement.save
      redirect_to account_path(@movement.account)
    else
      @account = @movement.account
      @movements = @account.movements
      render "accounts/show"
    end
  end

  private
  def movement_params
    params.require(:movement).permit(:amount, :date).merge(account_id: params[:account_id])
  end

end
