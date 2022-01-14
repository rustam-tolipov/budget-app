require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.new(name: 'Example User', email: 'tom@gmail.com', password: 'foobar', password_confirmation: 'foobar')

    @user.save

    @group = Group.new(name: 'Example Group', icon: 'home', color: '#000000')

    @group.save

    @entity = Entity.new(name: 'Example Entity', amount: 100, description: 'Example Description')

    @entity.save

    @group.entities << @entity
  end

  it 'should have a name' do
    @group.name
    expect(@group.name).to eq('Example Group')
  end

  it 'should have an icon' do
    @group.icon
    expect(@group.icon).to eq('home')
  end

  it 'should have a color' do
    @group.color
    expect(@group.color).to eq('#000000')
  end

  it 'should have entities' do
    @group.entities
    expect(@group.entities).to eq([@entity])
  end
end
