RSpec.describe InstaFeed do
  it 'initializes a instagram client on passing access token' do
    expect(InstaFeed.new('XXX').client).to be_an_instance_of(Instagram::Client)
  end

  it 'returns the list of feeds' do
    allow_any_instance_of(InstaFeed).to receive(:list).and_return([attributes_for(:insta_feed)])

    expect(InstaFeed.new('XXX').list).to eq([attributes_for(:insta_feed)])
  end
end
