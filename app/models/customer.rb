class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :addresses, dependent: :destroy
 has_many :cart_items, dependent: :destroy
 has_many :order, dependent: :destroy

  # (10/21 その)バリデーションのmaxlengthはWBSガントチャートの「データ」タブ参考
  # (10/21 その)下記必要最低限のバリデーション、minimumはのちに決めます
  validates :last_name, presence: true , length: { maximum: 8 }
  validates :first_name, presence: true , length: { maximum: 10 }
  validates :last_name_kana, presence: true , length: { maximum: 10 }
  validates :first_name_kana, presence: true , length: { maximum: 20 }
  validates :postcode, presence: true , length: { maximum: 8 }
  validates :telephone_number, presence: true , length: { maximum: 15 }
  validates :address, presence: true , length: { maximum: 161 }
  validates :email, presence: true , length: { maximum: 254 }
  
  # 姓(last_name)と名(irst_name)を合わせて表示する(顧客一覧画面customers/indexで使用)
  def full_name
    self.last_name + self.first_name
  end

end