json.array! @gigs do |gig|
  json.extract! gig, :id, :brand_name
  json.creator gig.creator, :id, :first_name, :last_name
end
