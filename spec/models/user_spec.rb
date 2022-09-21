require 'rails_helper'

RSpec.describe User, type: :model do
  # name,email,passwordが存在するユーザーの有効性
  it "is valid with a name, email and password" do
    user = User.new(
      name: "Admin User",
      email: "example@examle.com",
      password: "foobar",

    )
    expect(user).to be_valid
  end
  # emailがnilのユーザーの無効
  it "is invalid without an email" do
    user = User.new(
      email: nil,
      password: "foobar",
    )
    user.valid?
    expect(user.errors[:email]).to include ("can't be blank")
  end
  # 同一のemailのユーザーの無効
  it "is invalid with a duplicate email address" do
    User.create(
      email: "example@example.com",
      password: "foobar",
    )
    user = User.new(
      email: "example@example.com",
      password: "foobar",
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end
end
