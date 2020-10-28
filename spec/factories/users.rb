FactoryBot.define do

  factory :user do
    name                  {"aaaaaaaaaa"}
    email                 {"kkk@gmail.com"}
    image                 {File.open("#{Rails.root}/app/assets/images/myTown4.jpg")}
    introduce             {"aiueo"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    prefecture_id         {"1"}
    created_at            {"2020-10-27"}
    updated_at            {"2020-10-27"}

    before(:build) do |user|
      prefecture_id = create(:prefecture_id)
      user.prefecture_id << build(:prefecture_id)
    end
  end

end