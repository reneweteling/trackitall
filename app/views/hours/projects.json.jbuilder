json.array!(@projects) do |p|
  json.extract! p, :id, :name
end
