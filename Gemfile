source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "rails", "~> 5.2.3"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.12"
gem "bootsnap", ">= 1.1.0", require: false

gem "rack-cors"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-performance", "~> 1.4"
  gem "rubocop-rails", "~> 2.2"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
