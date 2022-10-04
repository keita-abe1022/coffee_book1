require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @another_user = FactoryBot.build(:user)
  end

  describe "validation" do
    it "正常に新規登録できる" do
      expect(@user).to be_valid
      @user.save
    end

    context "name" do
      it "空白だと登録できない" do
        @user.name = ' '
        expect(@user).to be_invalid
        expect(@user.errors.of_kind?(:name, :blank)).to be_truthy
      end

      it "20文字以内であること" do
        @user.name = 'a' * 20
        expect(@user).to be_valid
        @user.save        
      end

      it "21文字以上だと登録できないこと" do
        @user.name = 'a' * 21
        expect(@user).to be_invalid
        expect(@user.errors.of_kind?(:name, :too_long)).to be_truthy
      end
    end

    context "email" do
      it "空白だと登録できない" do
        @user.email = ' '
        expect(@user).to be_invalid
        expect(@user.errors.of_kind?(:email, :blank)).to be_truthy
      end

      it "255文字以内であること" do
        @user.email = 'a' * 243 + '@example.com'
        expect(@user).to be_valid
        @user.save
      end

      it "256文字以上だと登録できない" do
        @user.email =  'a'  * 244 + '@example.com'
        expect(@user).to be_invalid
        expect(@user.errors.of_kind?(:email, :too_long)).to be_truthy
      end

      it "有効な形式であること" do
        valid_addresses =  %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
        valid_addresses.each do |valid_address|
          @user.email = valid_address
          expect(@user).to be_valid
        end
        @user.save
      end

      it "無効な形式であること" do
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+bazz.com]
        invalid_addresses.each do |invalid_address|
          @user.email = invalid_address
          expect(@user).to be_invalid
        end
      end

      it "大文字小文字を区別しない一意性がある" do
        duplicate_user = @user.dup
        duplicate_user.email = @user.email.upcase
        @user.save
        expect(duplicate_user).to be_invalid
      end

      it "小文字で登録される" do
        mixed_case_email = "Foo@Example.CoM"
        @user.email = mixed_case_email
        @user.save
        expect(mixed_case_email.downcase).to eq @user.reload.email
      end

      it "重複していると登録できない" do
        @user.save
        @another_user.email = @user.email
        expect(@another_user).to be_invalid
        expect(@another_user.errors.of_kind?(:email, :taken)).to be_truthy
      end
    end 

    context "password" do
      it "空白だと登録できない" do
        @user.password = @user.password_confirmation =  ' ' * 6
        expect(@user).to be_invalid
        expect(@user.errors.of_kind?(:password, :blank)).to be_truthy
      end

      it "5文字以下だと登録できない" do
        @user.password = @user.password_confirmation = "a" * 5
        expect(@user).to be_invalid
        expect(@user.errors.of_kind?(:password, :too_short)).to be_truthy
      end

    end
  end
end
