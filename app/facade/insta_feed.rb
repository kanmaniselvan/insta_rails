class InstaFeed
  attr_reader :client

  def initialize(access_token)
    @client = Instagram.client(access_token: access_token)
  end

  def list
    client.user_recent_media.map do |media|
      {
          text: media.caption.try(:text),
          created_at: Time.at(media.created_time.to_i),
          likes_count: media.likes[:count],
          image_url: media.images['standard_resolution'].url
      }
    end
  end
end
