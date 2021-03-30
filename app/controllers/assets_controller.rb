class AssetsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @asset = Asset.new(asset_params)
    @account = @asset.account
    @movement = Movement.new
    @assets = @account.assets
    @last_asset = @account.assets.order('created_at DESC').find_by(params[:id])
    if @asset.save
      redirect_to account_path(@asset.account)
    else
      @assets = @account.assets.order('created_at DESC')
      @last_asset = @account.assets.order('created_at DESC').find_by(params[:id])
      @movements = @account.movements.order('created_at DESC')
      @last_movement = @account.movements.order('created_at DESC').find_by(params[:id])
      redirect_to account_path(@asset.account), notice: '※半角数字で０以上、2,000,000,000以下で入力してください'
    end
  end

  def destroy
    @account = Account.find(params[:account_id])
    account_asset = @account.assets.find(params[:id])
    if account_asset.destroy
      redirect_to request.referer
    end
  end

  private
  def asset_params
    params.require(:asset).permit(:amount, :date).merge(account_id: params[:account_id])
  end

end
