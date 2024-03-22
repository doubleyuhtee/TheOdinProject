def stock_picker(days)
  max_dif = []
  days.each_with_index do |d, i|
    max_and_subindex = days.slice(i+1..days.size).each_with_index.max
    max_and_subindex[1] += i + 1
    max_dif.append({i: i, j: max_and_subindex[1], v: max_and_subindex[0]-d})
    if i == days.size-2
      break
    end
  end
  out = max_dif.max_by{|v| v[:v]}
  puts out
  out
end

stock_picker([17,3,6,9,15,8,6,1,10])