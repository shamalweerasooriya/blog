FROM ruby:3.3-slim AS builder

ENV LANG=C.UTF-8 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

WORKDIR /site

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      build-essential \
      git \
      libffi-dev \
      libxml2-dev \
      libxslt1-dev \
      zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . /site

# Do not inherit a host Gemfile.lock or .bundle/config: they can force rake 12.x,
# which breaks sass-embedded's native extension on Ruby 3.3 (FileUtils::URI).
RUN rm -rf .bundle vendor/bundle \
    && rm -f Gemfile.lock \
    && bundle config set --local without 'development test' \
    && bundle install \
    && bundle exec jekyll build

FROM nginx:1.27-alpine AS runtime

COPY --from=builder /site/_site /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
