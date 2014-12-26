require 'rails_helper'

describe "Showing a user" do
  
  it "shows the user's profile page" do
    user = User.create!(user_attributes)

    visit user_url(user)

    expect(current_path).to eq(user_path(user))
    expect(page).to have_text(user.name)
  end
end