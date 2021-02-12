class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :day_of_birth

    ## 名前全体がかな/カナ/漢字であるかをチェック
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
      validates :first_name
      validates :last_name
    end

    ## 名前がカナであるかをチェック
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' } do
      validates :first_name_kana
      validates :last_name_kana
    end

    # #パスワード 半角英数字混合のバリデーション
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  end
end
