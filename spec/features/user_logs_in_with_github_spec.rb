require 'rails_helper'

def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: "github",
    uid: "23040094", 
    info: {"nickname"=>"timomitchel", "email"=>"timomitchel23@gmail.com", "name"=>"Timothy Tyrrell", "urls"=>{"GitHub"=>"https://github.com/timomitchel", "Blog"=>""}},
    credentials:{"token"=>"e81", "expires"=>false},
  })
end

RSpec.feature "user logs in" do
  scenario "using github oauth2" do
    stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Github")
    click_link "Sign in with Github"
    expect(page).to have_content("Timo")
    expect(page).to have_link("Logout")
  end
end