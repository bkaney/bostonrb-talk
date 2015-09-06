FROM ruby:2.2.3

# Install system dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm vim

# Create a directory for the app and make it the default working directory
RUN mkdir -p /myapp
WORKDIR /myapp

# Copy the Gemfile as well as the Gemfile.lock and install the RubyGems. This
# is a separate step so the dependencies will be cached unless changes to one
# of those two files are made.
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application, where the source is the cwd on the host machine
# and the destination is the location on the docker image, relative to the
# WORKDIR setting above
COPY . ./

# Expose port 3000 to the Docker host, so we can access it from the outside.
EXPOSE 3000

# Make sure "bundle exec" is run for each of our commands.
ENTRYPOINT ["bundle", "exec"]

# The main command to run when the container starts. Also tell the Rails dev
# server to bind to all interfaces by default.
CMD ["rails", "server", "-b", "0.0.0.0"]
