require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

  context '新規登録が上手く行く時' do
      it "nameとemail、passwordとpassword_confiramation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
 
    end


  context '新規登録できないとき' do
    it 'nameが空では登録できない' do
      @user.name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailに@を含めなければ登録できない' do
      @user.email = 'test11'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end   
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it'パスワードが空では登録ができない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it "passwordは数字のみでは登録できない" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "passwordは英語のみでは登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it "passwordは全角では登録できない" do
      @user.password = "１２ｑｙｒｙ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it'姓(全角)が空では登録ができない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it'姓(全角)が全角でなければ登録ができない' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
    end

    it'名(全角)が空では登録ができない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it'名(全角)が全角でなければ登録ができない' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
    end


    it'セイ(全角)が空では登録ができない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it'セイ(全角)がカタカナでなければ登録ができない' do
      @user.last_name_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana 全角カタカナを使用してください"
    end

    it'メイ(全角)が空では登録ができない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it'メイ(全角)がカタカナでなければ登録ができない' do
      @user.first_name_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana 全角カタカナを使用してください"
    end

    it'生年月日が空では登録ができない' do
      @user.day_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Day of birth can't be blank"
    end
   end
  end
end
