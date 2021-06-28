require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nameが空だと保存できないこと' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end

      it 'emailが空だと保存できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが同じものでは保存できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに@が含まれていない場合、保存できないこと' do
        @user.email = 'hoge.hoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空だと保存できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以下だと保存できないこと' do
        @user.password = 'a111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字混合でないと保存できないこと' do
        @user.password = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'password_confirmationが一致しないと保存できないこと' do
        @user.password_confirmation = '123abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'pssswordは全角では登録できないこと' do
        @user.password = '１２３abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'passwordは英語のみでは登録できないこと' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'first_name_full_widthが全角(漢字、ひらがな、カタカナ)でないと保存できないこと' do
        @user.first_name_full_width = 'a11'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name full width is invalid')
      end

      it 'last_name_full_widthが全角(漢字、ひらがな、カタカナ)でないと保存できないこと' do
        @user.last_name_full_width = 'ab1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name full width is invalid')
      end

      it 'first_name_full_widthは名字と名前がそれぞれ空だと保存できないこと' do
        @user.first_name_full_width = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name full width can't be blank")
      end

      it 'last_name_full_widthは名字と名前がそれぞれ空だと保存できないこと' do
        @user.last_name_full_width = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name full width can't be blank")
      end

      it 'first_name_kana_full_widthのフリガナは名字と名前が空では保存できないこと' do
        @user.first_name_kana_full_width = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana full width can't be blank")
      end

      it 'last_name_kana_full_widthのフリガナは名字と名前が空では保存できないこと' do
        @user.last_name_kana_full_width = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana full width can't be blank")
      end

      it 'first_name_kana_full_widthのフリガナは全角(カタカナ)での入力が必須であること' do
        @user.first_name_kana_full_width = 'すずき'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana full width is invalid')
      end

      it 'last_name_kana_full_widthのフリガナは全角(カタカナ)での入力が必須であること' do
        @user.last_name_kana_full_width = 'まさとし'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana full width is invalid')
      end

      it 'first_name_kana_full_widthは全角でないと保存できないこと' do
        @user.first_name_kana_full_width = 'ｽｽﾞｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana full width is invalid')
      end

      it 'last_name_kana_full_widtは全角でないと保存できないこと' do
        @user.last_name_kana_full_width = 'ﾏｻﾄｼ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana full width is invalid')
      end

      it 'birthdayが空では保存できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
