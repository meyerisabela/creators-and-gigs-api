json.extract! @gig, :id, :brand_name, :state
json.gig_payment @gig.gig_payment, :id, :state if @gig_payment
