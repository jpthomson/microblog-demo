class HomeController < ApplicationController
  def index
    @bleats = Bleat.all
  end
end
