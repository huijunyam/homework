def sum_to(n)
  if n < 0
    nil
  elsif n == 1
    n
  else
    n + sum_to(n - 1)
  end
end

# puts sum_to(5)  # => returns 15
# puts sum_to(1)  # => returns 1
# puts sum_to(9)  # => returns 45
# puts sum_to(-8) # => returns nil

def add_numbers(nums_array)
  if nums_array.length <= 1
    nums_array.first
  else
    nums_array.pop + add_numbers(nums_array)
  end
end

# puts add_numbers([1, 2, 3, 4]) # => returns 10
# puts add_numbers([3]) # => returns 3
# puts add_numbers([-80, 34, 7]) # => returns -39
# puts add_numbers([]) # => returns nil

def gamma_fnc(n)
  if n < 1
    nil
  elsif n == 1
    1
  else
    (n - 1) * gamma_fnc(n - 1)
  end
end

# puts gamma_fnc(0)  # => returns nil
# puts gamma_fnc(1)  # => returns 1
# puts gamma_fnc(4)  # => returns 6
# puts gamma_fnc(8)  # => returns 5040
