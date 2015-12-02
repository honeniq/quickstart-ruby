FROM ruby

WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle

ADD . /app

EXPOSE 4567 
ENV NAME World

CMD ["ruby", "app.rb"]
