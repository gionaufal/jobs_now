require 'rails_helper'

feature 'User applies to job' do
  scenario 'successfully' do

    job = create(:job)

    visit job_path(job)

    user = User.new(name: 'Giovanni Naufal',
                    description: 'Desenvolvedor rails junior com experiência em marketing',
                    github: 'http://github.com/gionaufal',
                    linkedin: 'http://linkedin.com/in/gionaufal',
                    email: 'gio@gionaufal.com',
                    phone: '5511555555555' )

    click_on 'Candidate-se'

    fill_in 'Nome Completo', with: user.name
    fill_in 'Resumo de competências/habilidades', with: user.description
    fill_in 'Github', with: user.github
    fill_in 'LinkedIn', with: user.linkedin
    fill_in 'Email', with: user.email
    fill_in 'Telefone', with: user.phone

    click_on 'Aplicar à Vaga'

    expect(page).to have_content 'Candidatura realizada com sucesso!'
    expect(page).to have_content user.name
    expect(page).to have_content user.description
    expect(page).to have_content user.github
    expect(page).to have_content user.linkedin
    expect(page).to have_content user.email
    expect(page).to have_content user.phone

  end
end
