require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it {should validate_presence_of(:provider)}
    it {should validate_presence_of :uid}
    it {should validate_presence_of :token}
    it {should validate_presence_of :expires}
  end
end
