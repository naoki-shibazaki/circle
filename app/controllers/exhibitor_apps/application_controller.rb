class ExhibitorApps::ApplicationController < ApplicationController
  before_action :authenticate_exhibition_group!

  # ExhibitorApps => ログインしてい出展者のみに適用するためのフォルダ分け

end