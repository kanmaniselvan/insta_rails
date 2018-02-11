RSpec.describe UsersController, type: :controller do
  render_views

  it 'renders login home page' do
    get(:home)

    expect(response.body).to match(/Login with Instagram/)
  end
end
