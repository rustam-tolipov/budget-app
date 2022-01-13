require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Example User', email: 'tom@gmail.com', password: 'foobar', password_confirmation: 'foobar')

    @user.save

    @group = Group.new(name: 'Example Group', icon: 'home', color: '#000000')

    @group.save

    @entity = Entity.new(name: 'Example Entity', amount: 100, description: 'Example Description')

    @entity.save
  end

  it 'should be valid' do
    expect(@user).to be_valid
  end

  it 'should have a name' do
    @user.name
    expect(@user.name).to eq('Example User')
  end

  it 'should have an email' do
    @user.email
    expect(@user.email).to eq('tom@gmail.com')
  end

  it 'should have a password' do
    @user.password
    expect(@user.password).to eq('foobar')
  end

  it 'should have a password_confirmation' do
    @user.password_confirmation
    expect(@user.password_confirmation).to eq('foobar')
  end
end
