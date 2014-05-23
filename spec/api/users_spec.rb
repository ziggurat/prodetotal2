require 'spec_helper'

describe 'Login' do

  it 'login for the first into the application' do
    expect(User.all.count).to eq(0)
    get '/api/v1/users/12345'
    expect(User.all.count).to eq(1)
  end

  it 'login into the application' do
    expect(User.all.count).to eq(0)
    get '/api/v1/users/12345'
    expect(User.all.count).to eq(1)

    get '/api/v1/users/12345'
    expect(User.all.count).to eq(1)
  end

end
