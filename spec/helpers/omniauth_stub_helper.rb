module OmniauthStubHelper
  def stub_omniauth(image = '')
    OmniAuth.config.test_mode = true

    user_attributes = attributes_for(:user).tap do |auth|
      auth[:extra] = { raw_info: {} }
      auth[:extra][:raw_info][:full_name] = 'Hi'
      auth[:extra][:raw_info][:username] = 'Hello'
      auth[:extra][:raw_info][:profile_picture] = image

      auth[:credentials] = { token: 'XYZ' }
    end

    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new(user_attributes)
  end
end
