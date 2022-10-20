class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if  @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render "edit"
    end
  end
  
  # def unsubscribe
    # 顧客の退会確認画面
  # end
  
  # def withdraw
    # 顧客の退会処理(ステータスの更新)
  # end
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:telephone_number,:address,:email,:encrypted_password,:is_deleted)
  end
end
