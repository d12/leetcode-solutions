def roman_to_int(s)
  numeral_to_decimal_values = {
      "IV" => 4,
      "IX" => 9,
      "XL" => 40,
      "XC" => 90,
      "CD" => 400,
      "CM" => 900,
      "I" => 1,
      "V" => 5,
      "X" => 10,
      "L" => 50,
      "C" => 100,
      "D" => 500,
      "M" => 1000
  }

  sum = 0

  numeral_to_decimal_values.each do |key, value|
      while s.slice! key
           sum += value
      end
  end

  sum
end