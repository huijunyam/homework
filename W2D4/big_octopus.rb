#Hungry Octopus
fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fish)
  longest_fish = fish[0]
  (0...fish.length).each do |i|
    (i...fish.length).each do |j|
      if fish[i].length < fish[j].length && longest_fish.length < fish[j].length
        longest_fish = fish[j]
      elsif fish[i].length > fish[j].length && longest_fish.length < fish[i].length
        longest_fish = fish[i]
      end
    end
  end
  longest_fish
end

def clever_octopus(fish)
  fish_length = 0
  longest_fish = ""
  fish.each do |f|
    if fish_length < f.length
      fish_length = f.length
      longest_fish = f
    end
  end
  longest_fish
end

def dorminant_octopus_sort(fish)
  return fish if fish.length <= 1
  medium = fish.length / 2
  left = dorminant_octopus_sort(fish.take(medium))
  right = dorminant_octopus_sort(fish.drop(medium))
  merge_octopus(left, right)
end

def merge_octopus(left, right)
  octopus = []
  until left.empty? || right.empty?
    if left[0].length <= right[0].length
      octopus << left.shift
    elsif right[0].length < left[0].length
      octopus << right.shift
    end
  end
  (octopus + left + right)
end

def dorminant_octopus(fish)
  dorminant_octopus_sort(fish)[-1]
end

#Dancing Octopus
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
tiles_hash = {
  "up" => 0,
  "right-up" => 1,
  "right" => 2,
  "right-down" => 3,
  "down" => 4,
  "left-down" => 5,
  "left" => 6,
  "left-up" => 7
}

def slow_dance(target, tiles)
  tiles.each_with_index do |tile, i|
    return i if tile == target
  end
end


def fast_dance(target, tiles_hash)
  tiles_hash[target]
end
