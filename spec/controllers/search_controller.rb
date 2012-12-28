require 'spec_helper'

describe SearchController do
  describe "GET search" do
    let(:bleat) { create(:bleat, :content => "howdy!") }
    
    it "renders the results template" do
      get :index, :q => 'howdy'
      response.should render_template("results")
    end
    
    it "should respond with bleats matching the query" do
      get :index, :q => 'howdy'
      assigns[:bleats].should include(bleat)
    end
  end
  
  describe "GET trending" do
    let(:bleat) { create(:bleat, :content => "lol, #winning") }
    
    it "renders the results template" do
      get :trending, :tag => '#winning'
      response.should render_template("results")
    end
    
    it "should respond with bleats containing the given tag" do
      get :trending, :tag => '#winning'
      assigns[:bleats].should include(bleat)
    end
  end
end
