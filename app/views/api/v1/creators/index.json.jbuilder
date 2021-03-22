json.array! @creators do |creator|
  json.extract! creator, :id, :first_name, :last_name
end
