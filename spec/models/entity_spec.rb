require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.new(name: 'Example User', email: 'tom@gmail.com', password: 'foobar', password_confirmation: 'foobar')

    @user.save

    @group = Group.new(name: 'Example Group', icon: 'home', color: '#000000')

    @group.save

    @entity = Entity.new(name: 'Example Entity', amount: 100, description: 'Example Description')

    @entity.save

    @group.entities << @entity

    @user.groups << @group
  end

  it 'should have a name' do
    @entity.name
    expect(@entity.name).to eq('Example Entity')
  end

  it 'should have an amount' do
    @entity.amount
    expect(@entity.amount).to eq(100)
  end

  it 'should have a description' do
    @entity.description
    expect(@entity.description).to eq('Example Description')
  end

  it 'should belong to a group' do
    @entity.group
    expect(@entity.group).to eq(@group)
  end
end
