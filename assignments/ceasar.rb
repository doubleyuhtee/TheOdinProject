class Ceasar
  def initialize
    test
  end
  def shift(c, amount, upper, lower)
    m = c.ord + amount
    (m < lower ? m + 26 : m > upper ? m - 26 : m).chr
  end

  def encode2(value, shift)
    out = value.split("").map do |c|
      bounds = if c >= 'a' and c < 'z'
                 { lower: 'a'.ord, upper: 'z'.ord, s: shift }
               else
                 (c >= 'A' and c <= 'Z') ? { lower: 'A'.ord, upper: 'Z'.ord, s: shift }
                   : { lower: c.ord, upper: c.ord, s: 0 }
               end
      shift(c, bounds[:s], bounds[:upper], bounds[:lower])
    end
    out.join("")
  end

  def encode(value, shift)
    upper = ("A".."Z").to_a
    lower = ("a".."z").to_a
    out = ""
    value.split('').each do |c|
      range = if upper.include?(c)
                upper
              else
                lower.include?(c) ? lower : nil
              end
      out_c = c
      if range
        c_val = c.ord + shift
        if range.first.ord > c_val
          c_val += 26
        elsif range.last.ord < c_val
          c_val -= 26
        end
        out_c = c_val.chr
      end
      out += out_c
    end
    out
  end

  def decode(value, shift)
    encode(value, shift * -1)
  end

  def test()
    ["Test sentence", "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "1234567890ABC",
     "The general synopsis at 0600

Low Wales 982 expected England 988 by 0600 tomorrow
Issued at: 11:30 (UTC) on Fri 1 Mar 2024.
For the period 12:00 (UTC) on Fri 1 Mar 2024 to 12:00 (UTC) on Sat 2 Mar 2024.
"].each do |s|
      puts "================================================================================="
      [1, 2, 5, 13].each do |c|
        puts "================================================================================="
        res = encode2(s, c)
        puts res
        res2 = encode2(res, -1*c)
        puts res2, res2 == s
        puts s.split('') - res2.split('')
      end
      puts "================================================================================="
    end
    puts "=================================================================================\n"
  end

  def test2()
    ("a".."z").map {|c| c*50}.map do |s|
      x = encode2(s, 4)
      d = encode2(x, -4)
      s == d
    end
  end

end

Ceasar.new
