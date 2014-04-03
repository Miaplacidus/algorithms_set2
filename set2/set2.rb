module Set2
  def self.find_intersection(array1, array2, array3)
    big_arr = []
    big_arr.concat(array1).concat(array2).concat(array3)
    rep_arr = []
    counter = 0

    while big_arr.length > 1
      counter = 0
      for i in 1...big_arr.length
        if big_arr[0] == big_arr[i]
          counter+=1
        end
      end
      if counter >=2
        rep_arr << big_arr[0]
      end
      big_arr.shift
    end

    return rep_arr
  end

  def self.find_first_dup(array)
    rep_hash = Hash.new(0)

    array.each do |item|
      rep_hash[item] += 1
      if rep_hash[item] == 2
        return item
      end
    end
    return nil
    end


    def self.find_mode(array)
      rep_hash = Hash.new(0)

      array.each do |item|
        rep_hash[item] += 1
      end
      max = 0
      mode = 0

      rep_hash.each do |k, v|
        if v > max
          max = v
          mode = k
        end
      end

      if max > 0
        mode
      else
        nil
      end

    end


end
