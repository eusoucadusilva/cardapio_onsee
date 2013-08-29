# encoding: utf-8

require 'machinist/active_record'

User.blueprint(:paulo_moura) do
  name { 'Paulo Moura' }
  email { 'paulo@ons.ee' }
  password { '12345678' }
  password_confirmation { '12345678' }
end

Recipe.blueprint(:acai_com_carne_de_sol) do
  avatar { 'imagem1.png' }
  title { 'Açaí com carne de sol' }
  description { 'Meus ingredientes são açaí e carne de sol' }
end
