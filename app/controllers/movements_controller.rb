class MovementsController < ApplicationController
  before_action :authenticate_user!

  def create
    @movement = Movement.new(movement_params)
    @account = @movement.account
    @movements = @account.movements
    @last_movement = @account.movements.order('created_at DESC').find_by(params[:id])
    if @movement.save
      redirect_to account_path(@movement.account)
    else
      render "accounts/show"
    end
  end

  def destroy
    @account = Account.find(params[:account_id])
    account_movement = @account.movements.find(params[:id])
    if account_movement.destroy
      redirect_to request.referer
    end
  end

  private
  def movement_params
    params.require(:movement).permit(:amount, :date).merge(account_id: params[:account_id])
  end

end
