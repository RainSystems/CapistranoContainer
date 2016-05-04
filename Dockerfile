FROM ruby:2.3-slim
RUN gem install capistrano:3.4.0 highline
WORKDIR /app
COPY wrap-cap.sh /wrap-cap
RUN chmod +x /wrap-cap
ENTRYPOINT ["/wrap-cap"]
