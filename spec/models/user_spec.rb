RSpec.configure do |c|
  c.include OmniauthStubHelper
end

RSpec.describe User do
  it 'creates new user from the Omniauth response' do
    User.destroy_all

    User.find_or_save_from_auth(stub_omniauth)
    expect(User.first.full_name).to eq('Hi')
  end

  it 'updates the existing user from the Omniauth response' do
    User.find_or_save_from_auth(stub_omniauth)
    expect(User.last.profile_picture).to eq('')

    User.find_or_save_from_auth(stub_omniauth('url_link'))
    expect(User.last.profile_picture).to eq('url_link')
  end
end
