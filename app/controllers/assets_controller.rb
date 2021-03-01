class AssetsController < ApplicationController
  
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

  private
  def asset_params
    params.require(:asset).permit(:amount, :date).merge(account_id: params[:account_id])
  end

end
