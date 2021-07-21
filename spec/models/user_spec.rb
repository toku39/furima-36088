require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname, email, password, password_confirmation, last_name, first_name, last_name_kana, first_name_kana, birthdayの値が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが一意性でないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'aaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'paswordが5文字以下だと登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは英語のみでは登録できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字でなければ登録できない')
      end
      it 'passwordは数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字でなければ登録できない')
      end
      it 'passwordは全角では登録できないこと' do
        @user.password = 'ａａａａａａ'
        @user.password_confirmation = 'ａａａａａａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字でなければ登録できない')
      end
      it 'first_name,last_nameは漢字・平仮名・カタカナ以外では登録できないこと' do
        @user.first_name = 'aaaaaa'
        @user.last_name = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 漢字・平仮名・カタカナ以外では登録できない', 'First name 漢字・平仮名・カタカナ以外では登録できない')
      end
      it 'first_name_kana,last_name_kanaは全角カタカナ以外では登録できないこと' do
        @user.first_name_kana = 'aaaaaa'
        @user.last_name_kana = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カタカナ以外では登録できない', 'First name kana 全角カタカナ以外では登録できない')
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空だと登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空だと登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birthdayが空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
