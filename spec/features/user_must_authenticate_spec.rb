require 'rails_helper'

feature 'User must authenticate' do
  scenario 'User signs up' do
    visit root_path

    click_on 'Cadastrar'

    fill_in 'E-mail',                      with: 'gio@gio.com'
    fill_in 'Senha',                       with: 'senha123'
    fill_in 'Confirme sua senha',          with: 'senha123'

    click_on 'Criar usuário'

    expect(page).to have_content 'Usuário criado com sucesso'
  end

  scenario 'with valid email' do
    visit root_path

    click_on 'Cadastrar'

    fill_in 'E-mail',                      with: 'gio'
    fill_in 'Senha',                       with: 'senha123'
    fill_in 'Confirme sua senha',          with: 'senha123'

    click_on 'Criar usuário'

    expect(page).to have_content 'Não foi possível criar o usuário'
  end

  scenario 'should not be able to create a company without loging in' do
    visit new_company_path

    expect(page).to have_content 'E-mail'
    expect(page).to have_content 'Senha'
  end

  scenario 'should not be able to create a category without loging in' do
    visit new_category_path

    expect(page).to have_content 'E-mail'
    expect(page).to have_content 'Senha'
  end

  scenario 'should not be able to edit a company without loging in' do

    company = create(:company)
    visit edit_company_path company

    expect(page).to have_content 'E-mail'
    expect(page).to have_content 'Senha'
  end
end
