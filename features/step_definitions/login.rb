Dado('que testenildo conecta no app') do
  @user = FactoryBot.create(:user, :testenildo)
  visit root_path
  expect(page).to have_selector 'h1', text: 'Bem vindo, estranho!'
end

Dado('existe uma lista pública') do
  @shared_list = FactoryBot.create(:list)
end

Dado('uma privada') do
  random_user = User.create(name: 'why_database_cleaner_is_not_doing_its_job', password: 'secret123', email: 'test@test.com')
  @private_list = List.create(name: 'Lista Privada', shared: false, user: random_user)
end

Quando('entra com as suas credênciais') do
  within('#new_user') do
    fill_in 'user_email', with: 'testenildo@ig.com'
    fill_in 'user_password', with: 'secret123'
  end
  within('.actions') do
    click_button 'Log in'
  end
end

Então('ele deve ver somente a lista pública') do
  expect(page).to have_selector 'td', text: @shared_list.name
  expect(page).not_to have_selector 'td', text: @private_list.name
end

Quando('ele digita a senha errada') do
  within('#new_user') do
    fill_in 'user_email', with: 'Testenildo@ig.com'
    fill_in 'user_password', with: 'senha?'
  end
  click_button 'Log in'
end

Então('ele ver um erro na tela') do
  expect(page).to have_selector '#flash_alert', text: 'Email ou senha inválida.'
end
