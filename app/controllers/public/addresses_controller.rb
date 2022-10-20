class Public::AddressesController < ApplicationController
  def index
    @address = Adress.new
    @addresses = Adress.all
  end

  def create
    @adress = Adress.new
  end

  def edit
    @address = Adress.find(params[:id])
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
