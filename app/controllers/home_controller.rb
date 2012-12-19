class HomeController < ApplicationController
  def index
    @bleats = Bleat.all
    @trending_tags = HashTag.trending
  end
end
