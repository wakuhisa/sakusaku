require 'rails_helper'

RSpec.describe User, type: :model do

  it "メール、パスワード、ニックネームがある場合、有効である" do
    user = User.new(
      email: "testman@example.com",
      password: "password",
      nickname: "testman"
    )
    expect(user).to be_valid
  end

  it "メールアドレスがない場合、無効である" do
    user = User.new(
      email: nil,
      password: "password",
      nickname: "testman"
    )
    expect(user.valid?).to eq(false)
  end

  it "重複したメールアドレスの場合、無効である" do
    User.create(
      email: "testman@example.com",
      password: "password",
      nickname: "testman"
    )

    @user = User.new(
      email: "testman@example.com",
      password: "password",
      nickname: "exampleman"
    )

    @user.valid?
    expect(@user.valid?).to eq(false)
  end

end