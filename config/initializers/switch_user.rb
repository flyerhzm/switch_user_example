SwitchUser.setup do |config|
  config.provider = :devise
  config.available_users = { user: -> { User.all }, admin: -> { Admin.all } }
  config.available_users_identifiers = { user: :id, admin: :id }
  config.available_users_names = { user: :email, admin: :email }
  config.controller_guard = ->(current_user, request) { true }
  config.view_guard = ->(current_user, request) { true }
  config.redirect_path = ->(request, params) { params[:scope_identifier] =~ /^admin/ ? '/admin' : '/' }
  config.helper_with_guest = false
end
