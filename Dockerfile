FROM ruby:latest

RUN apt-get update && apt-get install -y \
    apt-utils \
    python-pip

# RUN apt-get remove -y python-pip python3-pip
# RUN wget https://bootstrap.pypa.io/get-pip.py
# RUN python get-pip.py
# RUN python3 get-pip.py

RUN apt-get update

RUN pip install sympy
RUN pip install numpy

RUN mkdir /ilm

COPY ./lib/ilm/version.rb /ilm/lib//ilm/version.rb
COPY ./ilm.gemspec /ilm/ilm.gemspec
COPY ./Gemfile /ilm/Gemfile

WORKDIR /ilm

RUN gem install bundler
RUN bundle install
