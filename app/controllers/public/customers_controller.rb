class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    # byebug
    # @customer = Customer.find_by(id: params[:id])
    @customer = current_customer

  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path(@customer)
    else
      render 'edit'
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
    params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postcode,:telephone_number,:address,:email)
  end
end