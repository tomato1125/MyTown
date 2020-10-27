require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a name" do
      user = User.new(name: "", image:"ttt.jpg", introduce: "aaaaaaaa", email: "kkk@gmail.com", password:"00000000", password_confirmation: "00000000", prefecture_id: "5")
      user.valid?
      expect(user.errors[:name]).to include("が空になっています")
    end

    it "is invalid without a email" do
      user = User.new(name: "tomato", image:"ttt.jpg", introduce: "aaaaaaaa", email: "", password:"00000000", password_confirmation: "00000000", prefecture_id: "5")
      user.valid?
      expect(user.errors[:email]).to include("が空になっています")
    end
  end
end