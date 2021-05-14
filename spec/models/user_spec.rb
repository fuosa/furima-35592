require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "全ての項目が記入されていれば登録ができる" do
      expect(@user).to be_valid
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it 'family_nameが空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name can't be blank"
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'family_name_kanaが空では登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana can't be blank"
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it 'date_of_birthが空では登録できない' do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Date of birth can't be blank"
    end

    it '重複したemailが存在すると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end

    it 'passwordが6文字以上であれば登録できる' do
      @user.password = 'a123456'
      @user.password_confirmation = 'a123456'
      # binding.pry
      expect(@user).to be_valid
    end

    it 'passwordが５文字以下であると登録できない' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it 'passwordが半角英数混合(半角英語のみ)でないと登録できない' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      # binding.pry
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'family_nameが全角入力でないと登録できない' do
      @user.family_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name is invalid"
    end


    it 'first_nameが全角入力でないと登録できない' do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end

    it 'family_name_kanaが全角カタカナでないと登録できない' do
      @user.family_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include "Family name kana is invalid"
    end

    it 'first_name_kanaが全角カタカナでないと登録できない' do
      @user.first_name_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
  end
end
