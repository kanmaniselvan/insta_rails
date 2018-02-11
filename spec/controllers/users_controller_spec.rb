RSpec.describe UsersController, type: :controller do
  render_views

  it 'renders login home page' do
    get(:home)

    expect(response.body).to match(/Login with Instagram/)
  end

  it 'redirects to feeds page if user has already signed in' do
    session[:user_id] = create(:user)

    get(:home)

    expect(response.header['Location']).to match(/feeds/)
  end
end
