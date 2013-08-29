require 'spec_helper'

describe User do
  context 'relationships' do
    it { should have_many(:recipes) }
  end

  context 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
  end
end
