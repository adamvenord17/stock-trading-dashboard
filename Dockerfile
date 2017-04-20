FROM ruby:2.2.2

WORKDIR $HOME/

RUN git clone https://github.com/adamvenord17/stock-trading-dashboard.git
RUN cd stock-trading-dashboard


COPY Gemfile* $HOME/
RUN bundle install

ADD . $HOME
RUN bundle exec rake db:create db:migrate

#CMD ["bundle", "exec", "rails", "server"]
CMD rails server -e development -b 0.0.0.0 -p 3000
