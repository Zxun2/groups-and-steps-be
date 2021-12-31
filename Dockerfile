#  Select the base image to build from.
FROM ruby:3.0.2-alpine

# Install the required packages inside Docker.
RUN apk update && apk add bash build-base nodejs postgresql-dev tzdata

# Create a folder called project to host the codebase.
RUN mkdir /project

# Set the working directory to project folder.
WORKDIR /project

# Copy the files to the working directory.
COPY Gemfile Gemfile.lock ./

# Install the bundler gem.
RUN gem install bundler --no-document
RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

# Copy the codebase into Docker.
COPY . .

# Permissions
RUN addgroup -g 1000 docker && adduser -G docker -g docker -s /bin/sh -D docker
USER docker

# Expose port
EXPOSE 3001

# Start the main process.
CMD ["bundle", "exec", "rails", "server",  "-b", "0.0.0.0"]