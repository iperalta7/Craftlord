From ruby:3.2


COPY Gemfile ./
RUN gem install bundle
Run bundle install

COPY . /Craftmin/

WORKDIR /Craftmin

CMD ["ruby" "/src/bot.rb"]