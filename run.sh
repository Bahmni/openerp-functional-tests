set -ex
bundle install
bundle exec rspec spec/features/*.rb
