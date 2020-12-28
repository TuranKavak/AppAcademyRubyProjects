def quadratic_biggest_fish(fishes) #2 loops 
  fishes.each_with_index do |fish1, idx1|
    max_length = true
    
    fishes.each_with_index do |fish2, idx2|
      next if idx1 == idx2
      max_length = false if fish2.length > fish1.length
    end
    
    return fish1 if max_length
  end

end

class Array

#divide the array into two equal pieces, till two elements are left. Sort then merge recursively
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def nlogn_biggest_fish(fishes)#recursive sorting and choosing the first element
  # sort the array longest to shortest
  prc = Proc.new { |x, y| y.length <=> x.length }
  #return the first element
  fishes.merge_sort(&prc)[0]
end

def linear_biggest_fish(fishes)#O(n) goes through each element and updates biggest fish
  #hold the biggest fish
  biggest_fish = fishes.first

  fishes.each do |fish|
    if fish.length > biggest_fish.length
      #update the biggest fish
      biggest_fish = fish
    end
  end

  biggest_fish

end


#tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(tile, tiles_array)
    tiles_array.each.with_index do |tile1, idx1|
        return idx1 if tile == tile1
    end
end

#puts slow_dance("right", tiles_array)

#indexing with hash
tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(direction, tiles_hash)
  tiles_hash[direction] #tiles_hash[right-up] = 1 => O(1) time complexity
end