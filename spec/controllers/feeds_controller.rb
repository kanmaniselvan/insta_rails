RSpec.describe FeedsController, type: :controller do
  context 'without login' do
    it 'returns to home page without login' do
      get(:index)

      expect(flash[:error]).to eq('Please login before proceeding')
      expect(response).to redirect_to(root_path)
    end
  end

  context 'with login' do
    it 'lists the users feed' do
      session[:user_id] = create(:user).id
      allow_any_instance_of(InstaFeed).to receive(:list).and_return([attributes_for(:insta_feed)])

      get(:index)

      feeds = controller.instance_variable_get(:@feeds)
      expect(feeds).to eq([attributes_for(:insta_feed)])
    end
  end
end
