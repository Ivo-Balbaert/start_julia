anon = cell(2)
for i=1:2
  anon[i] = ()-> println(i)
  i += 1
end
anon[1]()
anon[2]()
