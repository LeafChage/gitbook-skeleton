FROM node:12.18.1-slim

WORKDIR /app

RUN apt update
RUN apt install --no-install-recommends -y \
    vim \
    make \
    calibre \
    fonts-takao \
    task-japanese \
    locales &&  \
    apt clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*;

# Japanese
RUN locale-gen ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:jp
ENV LC_ALL ja_JP.UTF-8

ADD ./package.json /app/package.json
ADD ./book.json /app/book.json

RUN yarn install
RUN npx gitbook install


