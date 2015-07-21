json.array!(@projects) do |p|
  json.id p.id
  json.name p.name + ' (' + p.company.name + ')'
end
