class User < ApplicationRecord
  validates_presence_of :provider, :uid, :token
  validates_inclusion_of :expires, :in => [true, false]

  def self.update_or_create(auth)
    auth = auth.deep_symbolize_keys
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
                        provider: auth[:provider],
                        uid: auth[:uid],
                        email: auth[:info][:email],
                        name: auth[:info][:name],
                        token: auth[:credentials][:token],
                        expires: auth[:credentials][:expires]
                      }
    user.save!
    user
  end
end
