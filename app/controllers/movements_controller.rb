class MovementsController < ApplicationController
  before_action :authenticate_user!

  def create
    @asset = Asset.new
    @movement = Movement.new(movement_params)
    @account = @movement.account
    @movements = @account.movements
    @last_movement = @account.movements.order('created_at DESC').find_by(params[:id])
    if @movement.save
      redirect_to account_path(@movement.account)
    else
      @movements = @account.movements.order('created_at DESC')
      @last_movement = @account.movements.order('created_at DESC').find_by(params[:id])  
      @assets = @account.assets.order('created_at DESC')
      @last_asset = @account.assets.order('created_at DESC').find_by(params[:id])  
      redirect_to account_path(@movement.account), notice: '※半角数字で０以上、2,000,000,000以下で入力してください'
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
