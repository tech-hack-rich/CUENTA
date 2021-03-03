class AssetsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @asset = Asset.new(asset_params)
    if @asset.save
      redirect_to account_path(@asset.account)
    else
      @account = @asset.account
      @assets = @account.assets
      render "accounts/show"
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
