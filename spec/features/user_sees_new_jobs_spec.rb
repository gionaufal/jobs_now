require 'rails_helper'

feature 'user sees recent jobs' do
  scenario 'successfully' do
    job = create(:job)

    visit root_path

    expect(page).to have_content job.title
    expect(page).to have_content 'Novidade!'

  end

  scenario 'job created 6 days ago' do
    travel_to 6.days.ago do
      job = create(:job)
    end

    visit root_path

    expect(page).not_to have_content 'Novidade!'
  end
end
