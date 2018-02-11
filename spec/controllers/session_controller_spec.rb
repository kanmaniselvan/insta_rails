RSpec.configure do |c|
  c.include OmniauthStubHelper
end

RSpec.describe SessionsController, type: :controller do
  it 'logins using instagram omniauth and sets sessions' do
    request.env['omniauth.auth'] = stub_omniauth

    get(:create)
    expect(session[:user_id]).to eq(User.last.id)
    expect(session[:access_token]).to eq('XYZ')
  end

  it 'destroys sessions' do
    get(:destroy)
    expect(session[:user_id]).to be_nil
    expect(session[:access_token]).to be_nil
  end
end
