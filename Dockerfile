FROM ruby:2.7.6

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  npm

# Yarnをインストール
RUN npm install -g yarn

WORKDIR /app

# package.jsonとyarn.lockを確実にコピーする
COPY ./package.json /app/package.json
COPY ./yarn.lock /app/yarn.lock

# ファイルが正しくコピーされたか確認
RUN ls -al

# Yarnがインストールされているか確認
RUN yarn --version

# Yarnで依存関係をインストール
RUN yarn install

# GemfileとGemfile.lockをコピーしてbundle installを実行
COPY Gemfile* ./
RUN bundle install

# プロジェクト全体をコピー
COPY . .

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
