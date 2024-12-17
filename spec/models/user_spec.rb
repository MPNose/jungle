require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end
  end
end
