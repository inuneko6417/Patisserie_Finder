require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Myapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :local
    # config.eager_load_paths << Rails.root.join("extras")

    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join("config/locales/**/*.yml").to_s]
    config.assets.enabled = true
    config.assets.paths << Rails.root.join("app", "assets", "stylesheets")
    # Active Storage の URL オプションを設定
    config.after_initialize do
      ActiveStorage::Current.url_options = { host: 'http://localhost:3000' } # 本番環境では適宜変更
    end
    # mini_magickの追記
    Rails.application.config.active_storage.variant_processor = :mini_magick
  end
end
