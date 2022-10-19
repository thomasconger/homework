def sum_to(n)
  return nil if n < 0
  return n if n == 0

  n + sum_to(n-1)
end

# puts sum_to(5)  # => returns 15
# puts sum_to(1)  # => returns 1
# puts sum_to(9)  # => returns 45
# puts sum_to(-8)  # => returns nil

def add_numbers(arr)
  return nil if arr.length == 0
  return arr[0] if arr.length == 1

  arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(n)
  return nil if n == 0
  return 1 if n == 1


  (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)

  #base case is flavors[x] = favorite
  return true if flavors[0] == favorite
  return false if flavors.length == 0

  #induction
  ice_cream_shop(flavors[1..-1],favorite)

end

def reverse(string)
  return "" if string == ""
  return string if string.length == 1

  reverse(string[1..-1]) + string[0]


end
