class MyHash
  def initialize
    @array = Array.new(64){[]}
    @num_items = 0
  end

  # [
  #   0[[key, value], [key, value]],
  #   1[[key,value]], [key, value]],
  #   2[[item0, item1], [item0, item1]]
  # ]

  def find_index(key)
    key.hash % @array.length
  end

  def []=(key, value)
    @array[self.find_index(key)].each do |kv_arr|
      if key == kv_arr[0]
        kv_arr[1] = value
        return
      end
    end
    @array[self.find_index(key)] << [key, value]
    @num_items+=1

    if @num_items >= @array.length/2.0
      self.rehash(@array.length*2)
    end
  end

  def [](key)
    @array[self.find_index(key)].each do |kv_arr|
      if key == kv_arr[0]
        return kv_arr[1]
      end
    end
    nil
  end

  def rehash(new_size)
    old_arr = @array
    @array = Array.new(new_size){[]}
    old_arr.each do |index|
      index.each do |kv_arr|
        self[kv_arr[0]] = kv_arr[1]
      end
    end
  end

end
