FactoryBot.define do
  factory :insta_feed do
    text 'Welcome'
    created_at '1476587962'
    likes_count 15
    image_url 'https://scontent.cdninstagram.com/vp/13f96b68557f23f4e6e55176b96a4ecf/5B104BE2/t51.2885-15/s640x640/sh0.08/e35/12424658_987279734701358_1953225345_n.jpg'

    skip_create
    initialize_with { new(attributes) }
  end
end
