require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it {should validate_presence_of :provider}
    it {should validate_presence_of :uid}
    it {should validate_presence_of :token}
  end
  context "class methods" do
    it "should create or update itself from oauth hash" do 
      auth = {
              provider: "github",
              uid: "23040094", 
              info: {"nickname"=>"timomitchel", "email"=>"timomitchel23@gmail.com", "name"=>"Timothy Tyrrell", "urls"=>{"GitHub"=>"https://github.com/timomitchel", "Blog"=>""}},
              credentials:{"token"=>"e81", "expires"=>false},
            }
      User.update_or_create(auth)
      new_user = User.first

      expect(new_user.provider).to eq("github")
      expect(new_user.uid).to eq("23040094")
      expect(new_user.email).to eq("timomitchel23@gmail.com")
      expect(new_user.name).to eq("Timothy Tyrrell")
      expect(new_user.token).to eq("e81")
      expect(new_user.expires).to eq false
    end
  end
end
