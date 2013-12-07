json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :user_id, :taxi_id, :rank, :comment
  json.url feedback_url(feedback, format: :json)
end
