require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do
   
  it 'should exist for new record' do
    @user= User.new(password: "abc")
    expect(@user.password).to be_present
    

  end
  it 'should match ' do
    @user= User.new(password: "abc", password_confirmation: "abc")
   # @user.password = "abc"
    #@user.password_confirmation
    expect(@user).to be_valid
    

  end

  it 'should match ' do
    @user= User.new(password: "abc", password_confirmation: "111")
   # @user.password = "abc"
    #@user.password_confirmation
    expect(@user).not_to be_valid
    

  end

  
  it 'email should exist for new record' do
    @user= User.new(email: "test@test.com",password: "abc")
    expect(@user).to be_valid
  end
  
  it 'first_name should valid for new record' do
    @user= User.new(first_name: "abc",password: "abcdde")
    expect(@user).to be_valid
   end
  
  it 'last_name valid for new record' do
    @user= User.new(last_name: "abc", password:"abc")
    expect(@user).to be_valid
  end

  it 'email should not be uppercase for new record' do
    @user= User.new(email: "test@test.COM",password: "abc")
    expect(@user).to be_valid
  end
  it 'password should exist for new record' do
    @user= User.new(email: "test@test.com",password: "abc")
    expect(@user).to be_valid
  end

  it 'password must have minimum length' do
    @user= User.new(email: "test@test.com",password: "abc")
    expect(@user).to be_valid
  end


  end
  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.create(email: "test@test.com", password: "123456", password_confirmation: "123456")
    end

    it 'authenticates a user with correct credentials 'do
    authenticated_user = User.authenticate_with_credentials(@user.email,@user.password)
    expect(authenticated_user).to eq(@user)
    end

    it 'authenticates if email has spaces in beginning' do
      authenticated_user=User.authenticate_with_credentials(' test@test.com     ','123456')
      expect(authenticated_user).to eq(@user)
    end

    it 'authenticates if email has uppercase' do
      authenticated_user=User.authenticate_with_credentials(' teSt@tESt.COM ','123456')
      expect(authenticated_user).to eq(@user)
    end

  end
end
