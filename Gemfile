source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem "active_model_serializers", "~> 0.10.14"
gem "bootsnap", require: false
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.8"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "sqlite3", "~> 1.4"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "faker", "~> 3.2"
  gem "listen", "~> 3.3"
  gem "spring"
end

group :production do
  gem "pg", "~> 1.5"
end
