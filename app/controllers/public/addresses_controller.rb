class Public::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.all
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to request.referer, notice: "新規登録完了しました"
    else
      @addresses = Address.all
      render "index"
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      redirect_to addresses_path, notice: "更新完了しました。"
    else
      render edit
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to request.referer
  end

  private

  def address_params
    params.require(:address).permit(:postcode, :address, :name)
  end

end
