def dominant_octopus(fish)
  prc = Proc.new {|x,y|y.length <=> x.length}
  fish.merge_sort(&prc)[0]
end

def slow(fish)
  biggest_fish = fish.first

  fish.each do |el|
    if fish.lengt > biggest_fish.length
      biggest_fish =fish
    end
  end

  biggest_fish
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new {|x,y| x <=> y}

    return self if count <= 1

    mid = length/2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left,right,&prc)
  end

  def self.merge(left,right,&prc)
    result = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        result << left.shift
      when 0
        result << left.shift
      when 1
        result << right.shift
      end
    end

    result.concat(left)
    result.concat(right)

    result
  end
end

def slow_dance(dir, arr)
  arr.each_with_index do |arr, idx|
    return idx if arr == dir
  end
end

def fast_dance(dir,hash)
  hash[dir]
end
