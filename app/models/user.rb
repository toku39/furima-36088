class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validate :email

    # NAME_REGIX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
    # NAMEKANA_REZIX = /\A[ァ-ヶー－]+\z/
    # PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  with_options presence: true do
    validates :nickname
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '漢字・平仮名・カタカナ以外では登録できない' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '漢字・平仮名・カタカナ以外では登録できない' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナ以外では登録できない' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナ以外では登録できない' }
    validates :birthday
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze, message: '半角英数字でなければ登録できない' }
  end

  # has_many :items
  # has_many :purchases
end
