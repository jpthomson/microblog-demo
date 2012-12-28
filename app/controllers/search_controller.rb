class SearchController < ApplicationController
  def index
    query = params[:q].downcase
    @title = "Results for <b>#{query}</b>".html_safe
    @bleats = Bleat.where("lower(content) LIKE ?", "%#{query}%")
    render :template => 'search/results'
  end

  def trending
    # TODO: group and sort
    tag = params[:tag].downcase
    @title = "Results for <b>#{tag}</b>".html_safe
    @bleats = Bleat.joins(:hash_tags).where('tag = ?', tag)
    render :template => 'search/results'
  end  
end
