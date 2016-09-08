require 'rails_helper'

feature 'User edits company' do
  scenario 'successfully' do
    company = create(:company)

    visit edit_company_path(company)

    fill_in 'Nome', with: 'Google'
    fill_in 'Localização', with: 'SP'
    fill_in 'Email', with: 'jobs@google.com'

    click_on 'Atualizar Empresa'

    expect(page).to have_css('h1', text: 'Google')
    expect(page).to have_content 'SP'
    expect(page).to have_content 'jobs@google.com'
  end

  scenario 'should fill all fields' do
    company = create(:company)

    visit edit_company_path(company)

    fill_in 'Nome', with: ''

    click_on 'Atualizar Empresa'

    expect(page).to have_content 'Preencha todos os campos'
  end
end
