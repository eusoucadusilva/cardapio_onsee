# encoding: utf-8

require 'spec_helper'

feature "Recipes" do
  let(:paulo_moura) { User.make!(:paulo_moura) }

  background do
    login_as paulo_moura, scope: :user

    visit root_path
  end

  scenario 'create recipe' do
    expect(page).to have_content 'Bem vindo, paulo@ons.ee'

    click_link 'Bem vindo, paulo@ons.ee'
    click_link 'Cadastrar Receita'

    expect(page).to have_content 'Divulgue sua receita para o mundo!'

    fill_in 'Título', with: 'X-Tudo Paraense'
    fill_in 'Descrição', with: 'Leva Pão, Queijo, Açaí e Camarão.'

    click_button 'Criar Receita'

    expect(page).to have_content 'Receita criada com sucesso.'

    expect(page).to have_content 'Atualize sua receita.'

    expect(page).to have_field 'Título', 'X-Tudo Parense'
    expect(page).to have_field 'Descrição', 'Leva Pão, Queijo, Açaí e Camarão.'

    print page.html
  end
end
