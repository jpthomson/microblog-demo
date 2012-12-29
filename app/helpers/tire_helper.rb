module TireHelper

  def search_for(*args,&block)
    tire.__send__(:search, *args, &block)
  end

  def tire_available?
    !Gem::Specification::find_all_by_name('tire').empty?
  end

end
