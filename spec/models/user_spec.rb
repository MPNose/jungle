require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password', password_confirmation: 'password')
      expect(user).to be_valid
    end
    it 'is invalid without a first name' do
      user = User.new(first_name: nil, last_name: 'Doe', email: 'john@example.com', password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
    end
    it 'is invalid without a last name' do
      user = User.new(first_name: 'John', last_name: nil, email: 'john@example.com', password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
    end
    it 'is invalid without an email' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: nil, password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
    end
    it 'is invalid if password and password_confirmation do not match' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password', password_confirmation: 'different_password')
      expect(user).to_not be_valid
    end
    it 'is invalid if password is less than 5 characters' do
      user = User.new(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'pass', password_confirmation: 'pass')
      expect(user).to_not be_valid
    end
    it 'is invalid if email is not unique (case insensitive)' do
      User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password', password_confirmation: 'password')
      user = User.new(first_name: 'Jane', last_name: 'Smith', email: 'JOHN@example.com', password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
    end

  end
  describe '.authenticate_with_credentials' do
    let!(:user) { User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password', password_confirmation: 'password') }

    it 'authenticates successfully with correct email and password' do
      authenticated_user = User.authenticate_with_credentials('john@example.com', 'password')
      expect(authenticated_user).to eq(user)
    end
    it 'returns nil for incorrect password' do
      authenticated_user = User.authenticate_with_credentials('john@example.com', 'wrongpassword')
      expect(authenticated_user).to be_nil
    end
    it 'authenticates successfully with email containing leading/trailing spaces' do
      authenticated_user = User.authenticate_with_credentials('  john@example.com  ', 'password')
      expect(authenticated_user).to eq(user)
    end
    it 'authenticates successfully with email in different case' do
      authenticated_user = User.authenticate_with_credentials('JOHN@example.COM', 'password')
      expect(authenticated_user).to eq(user)
    end
  end
end
