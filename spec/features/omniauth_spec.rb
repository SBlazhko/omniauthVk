require "rails_helper"
require 'spec_helper'

feature "Omniauth VK" do
  before(:each) do
    OmniAuth.config.mock_auth[:vkontakte] = OmniAuth::AuthHash.new(
      provider: 'vkontakte',
      uid: '22222',
      info: { email: 'Blaghco@ukr.net' }
    )
    visit '/sessions/new'
    click_link 'VK'
  end

  scenario "Signing in " do
    expect(page).to have_content 'Blaghco@ukr.net'
    expect(page).to have_content 'Logout'
  end

  scenario "Signing out" do
    click_link 'Logout'

    expect(page).to have_content "VK"
  end
end