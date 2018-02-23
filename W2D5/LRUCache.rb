class LRUCache
  def initialize(length)
    @length = length
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    elsif count >= @length
      @cache.shift
      @cache << el
    else
      @cache << el
    end
  end

  def show
    p @cache
    nil
  end

  private
end
