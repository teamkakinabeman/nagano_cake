class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    @addresses = Address.all
  end
  
  def save
    
  end

  def create
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to addresses_path, notice: "更新完了しました。"
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to request.referer
  end

  private

  def address_params
    params.require(:adress).permit(:postcode, :address, :name)
  end

end
