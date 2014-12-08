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

    expect(user1.errors.present?).to be(false)
    expect(user2.errors.present?).to be(true)
  end

end
