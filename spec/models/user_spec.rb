require 'rails_helper'

describe User do

  it "rejects duplicate emails" do
    user1 = User.create(
      first_name: 'John',
      last_name: 'Smith',
      email: 'j@s.com',
      password: '1234'
    )

    user2 =  User.create(
      first_name: 'Joe',
      last_name: 'Schmoe',
      email: 'j@s.com',
      password: '4321'
    )

    expect(user1.errors[:email].present?).to eq(false)
    expect(user2.errors[:email]).to include("has already been taken")
  end

  it 'accepts case-insensitive input for emails' do
    user = User.create(
    first_name: 'John',
    last_name: 'Smith',
    email: 'J@S.com',
    password: '1234'
    )

    expect(user.email).to eq('j@s.com')
    expect(user.errors[:email].present?).to eq(false)
  end

  it 'requires all fields to have existent data' do
    user = User.create(
    first_name: '',
    last_name: '',
    email: '',
    password: ''
    )

    expect(user.errors[:first_name]).to include("can't be blank")
    expect(user.errors[:last_name]).to include("can't be blank")
    expect(user.errors[:email]).to include("can't be blank")
    expect(user.errors[:password]).to include("can't be blank")
  end

end
