class User < ApplicationRecord
  validates :provider, :uid, :full_name, :username, presence: true
  validates_uniqueness_of :uid, scope: [:provider]

  def self.find_or_save_from_auth(auth)
    user_info = auth.extra.raw_info
    User.where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.full_name = user_info.full_name
      user.username = user_info.username
      user.profile_picture = user_info.profile_picture
      user.save!
    end
  end
end
