source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem "active_model_serializers", "~> 0.10.14"
gem "bootsnap", require: false
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.8"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "sqlite3", "~> 1.4"
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "rspec-rails", "~> 6.1"
end

group :development do
  gem "faker", "~> 3.2"
  gem "listen", "~> 3.3"
  gem "spring"
end

group :production do
  gem "pg", "~> 1.2"
end

group :test do
  gem "shoulda-matchers", "~> 6.0"
  gem "simplecov", "~> 0.22.0", require: false
end

gem "bundler-audit", "~> 0.9.1"

gem "brakeman", "~> 6.1"
gem "rubocop", "~> 1.59", require: false
