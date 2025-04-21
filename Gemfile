source "https://rubygems.org"

ruby "3.3.6" # Rubyのバージョンを固定する場合はここに記述

# =======================
# Rails & Core Components
# =======================
gem "rails", "~> 7.2.2", ">= 7.2.2.1"
gem "pg", "~> 1.1"                          # PostgreSQL
gem "puma", ">= 5.0"                        # Webサーバー
gem "sprockets-rails"                      # Asset Pipeline

# ==========================
# Frontend (JS/CSS bundling)
# ==========================
gem "jsbundling-rails"
gem "cssbundling-rails"

# ===================
# Hotwire Components
# ===================
gem "turbo-rails"
gem "stimulus-rails"

# ============
# Authentication
# ============
gem "devise"
gem "bcrypt", "~> 3.1.7"

# =========
# Utilities
# =========
gem "jbuilder"                             # JSON API用
gem "rails-i18n"                           # 多言語対応
gem "ransack"                              # 検索機能
gem "kaminari"                             # ページネーション
gem "image_processing"                     # 画像処理（Active Storage用）
gem "carrierwave"                          # アップローダー
gem "mini_magick", "~> 4.13"               # 画像処理（MiniMagick）
gem "draper"                               # デコレータ
gem "faker"                                # ダミーデータ生成
gem "meta-tags"                            # SEO対策

# ===============
# Development & Test
# ===============
group :development, :test do
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "dotenv-rails"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

# ==========
# Platform
# ==========
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false

# =====================
# Optional / Commented Out
# =====================
# gem "redis", ">= 4.0.1"
# gem "kredis"
# gem "tailwindcss-rails", "~> 3.1"
# gem "bootstrap", "~> 5.3.0"
# gem "autoprefixer-rails"
# gem "sassc-rails"
# gem "image_processing", "~> 1.2"
