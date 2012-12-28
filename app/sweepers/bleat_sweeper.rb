class BleatSweeper < ActionController::Caching::Sweeper
  observe Bleat
  
  def after_create(bleat)
    expire_cache_for(bleat)
  end
 
  def after_destroy(bleat)
    expire_cache_for(bleat)
  end
 
  private
  def expire_cache_for(bleat)
    # expire_fragment(:controller => 'bleats', :action => 'show', :id => user.id)
  end
end
