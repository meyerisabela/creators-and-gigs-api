every 2.minutes do
  runner 'GigPayment.pending_state_to_completed'
end
