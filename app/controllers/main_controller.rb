class MainController < ApplicationController
  def show
    #ランキングの表示
    #サイトの一覧を取得
    @sites = SiteMst.all
  end
end
