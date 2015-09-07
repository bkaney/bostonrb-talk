require 'rails_helper'

feature 'Visiting the landing page' do
  scenario "user sees welcome message." do
    visit "/"

    expect(page).to have_text 'Welcome aboard'
  end
end
