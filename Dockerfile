FROM ruby:2.6.10
ENV RAILS_ENV="development" \
    HOST_DOMAIN="localhost" \
    SECRET_KEY_BASE="18d3d80d3b7ac632da94d3de8f43143cd0b9efac306c05eff97a190f062c98ae9332463b295b15707d8319a6614d0729b70b7d1da1abe42af8519f926cebbd86"

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

COPY ["Gemfile", "Gemfile.lock", "./"]
RUN bundle install
COPY . .

EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]