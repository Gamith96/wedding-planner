OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '264572520670843', 'd16f9ccdfcf855ac1627f928f4e9e2b4'
end
