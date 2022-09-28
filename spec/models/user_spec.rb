require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  let(:another_user) { FactoryBot.build{:user} }

  describe "validation" do
    it "正常に新規登録できる" do
      expect(user).to be_valid
      user.save
    end

    context "name" do
      it "空白でないこと" do
        user.name = nil
        user.valid?
        # expect(user.errors[:name]).to include ("can't be blank")
        expect(user.errors.added?(:name, :blank)).to be_truthy
      end

      it "20文字以内であること" do
        user.name = 'a' * 20
        expect(user).to be_valid
        user.save        
      end

      it "21文字以上だと登録できないこと" do
        user.name = 'a' * 21
        expect(user).to be_invalid
        expect(user.errors.of_kind?(:name, :too_long)).to be_truthy
      end
    end

    context "email" do
      it "is invalid without an email" do
        user = User.create(
          name: "user1",
          email: nil,
          password: "foobar",
        )
        user.valid?
        expect(user.errors[:email]).to include ("can't be blank")
      end

      it "is invalid with a duplicate email address" do
        User.create(
          name: "user1",
          email: "user1@user1.com",
          password: "foobar",
        )
        user = User.new(
          name: "user2",
          email: "user1@user1.com",
          password: "foobar2",
        )
        user.valid?
        expect(user.errors[:email]).to include("has already been taken")
      end
    end 
  end
end
