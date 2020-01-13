def fibs(number)
  sequence = Array.new(number + 1) { |i| i }
  sequence.map! { |num| num > 1 ? sequence[num-1] + sequence[num-2] : num }
end

p fibs(10)

def fibs_rec(number)
  number.between?(0,1) ? Array.new(number+1) {|i| i } : fibs_rec(number-1) << fibs_rec(number-1)[-1] + fibs_rec(number-1)[-2]
end

p fibs_rec(10)