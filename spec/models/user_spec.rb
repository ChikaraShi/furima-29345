require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    it 'nick_nameが空だと登録できない' do
      @user.nick_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    it 'emailが空では登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが一意性' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailが@の有無' do
      @user.email = 'fghj'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが空では登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordのミニマム' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordの混合' do
      @user.password = 'asdfgdf'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordの数字' do
      @user.password = '123333'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'kanji_famが空では登録できない' do
      @user.kanji_fam = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji fam can't be blank")
    end
    it 'kanji_famが半角以外' do
      @user.kanji_fam = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji fam Last name Full-width characters and can't be blank")
    end
    it 'kanji_givenが空では登録できない' do
      @user.kanji_given = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji given can't be blank")
    end
    it 'kanji_givenが半角以外' do
      @user.kanji_given = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kanji given First name Full-width characters and can't be blank")
    end
    it 'kana_famが空では登録できない' do
      @user.kana_fam = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana fam can't be blank")
    end
    it 'kana_famがカナ' do
      @user.kana_fam = '漢字ひらgh'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana fam Last name kana Full-width katakana characters and can't be blank")
    end
    it 'kana_givenが空では登録できない' do
      @user.kana_given = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana given can't be blank")
    end
    it 'kana_givenがカナ' do
      @user.kana_given = '漢字'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana given First name kana Full-width katakana characters and can't be blank")
    end
    it 'birthが空では登録できない' do
      @user.birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
