Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :kakao, ENV['KAKAO_CLIENT_ID']

  # 또는 Redirect Path를 설정하고 싶다면(or if you want to customize your Redirect Path)
  provider :kakao, ENV['KAKAO_CLIENT_ID'], {:redirect_path => '/users/auth/kakao/callback'}
end