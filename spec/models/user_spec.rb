require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it {should validate_presence_of :provider}
    it {should validate_presence_of :uid}
    it {should validate_presence_of :token}
    it {should validate_presence_of :expires}
  end
  context "class methods" do
    it "should create or update itself from oauth hash"
      auth = {
              provider: "github",
              uid: "23040094", 
              info: {"nickname"=>"timomitchel", "email"=>"timomitchel23@gmail.com", "name"=>"Timothy Tyrrell", "urls"=>{"GitHub"=>"https://github.com/timomitchel", "Blog"=>""}},
              credentials:{"token"=>"9950576d1c4753e5beb1e364d93a25a4a7e4c981", "expires"=>false},
            }
      User.update_or_create(auth)
      new_user = User.first

    expect(new_user.provider).to eq("github")
    expect(new_user.uid).to eq("23040094")
    expect(new_user.email).to eq("timomitchel23@gmail.com")
    expect(new_user.name).to eq("Jesse")
    expect(new_user.token).to eq("abcdefg12345")
    expect(new_user.refresh_token).to eq("12345abcdefg")
    expect(new_user.oauth_expires_at).to eq(auth[:credentials][:expires_at])
  end
end
