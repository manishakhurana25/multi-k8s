FROM ruby:2.3
WORKDIR '/app'
COPY ./ ./
CMD ["sh"]