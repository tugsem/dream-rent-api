# Make sure it matches the Ruby version in .ruby-version and Gemfile
FROM ruby:3.1.2

# Install PostgreSQL client libraries and headers
RUN apt-get update && \
    apt-get install -y postgresql-client libpq-dev

RUN apt-get install -y nodejs
# Rails app lives here
WORKDIR /app

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile --gemfile app/ lib/

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD bundle exec rails db:create && bundle exec rails db:migrate RAILS_ENV=development && bundle exec rails s -p 3000 -b 0.0.0.0