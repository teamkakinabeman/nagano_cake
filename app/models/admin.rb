class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # consoleからのみ登録可能にするため:registerableを削除（しま）
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
end
