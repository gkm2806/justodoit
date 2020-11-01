Dado('que testenildo conecta no app') do
  @user = FactoryBot.create(:user, :testenildo)
  visit root_path
  expect(page).to have_selector 'h1', text: 'Bem vindo, estranho!'
end

Dado('existe uma lista pública') do
  @list = FactoryBot.create(:list)
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

Então('ele deve ver as listas públicas') do
  expect(page).to have_selector 'td', text: 'Lista Compartilhada'
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
