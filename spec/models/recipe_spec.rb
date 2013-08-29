require 'spec_helper'

describe Recipe do
  context 'relationships' do
    it { should belong_to(:user) }
  end

  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description}
    it { should validate_presence_of :avatar }
    it { should validate_presence_of :user }
  end
end
