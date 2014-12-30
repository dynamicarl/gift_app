json.array!(@recipients) do |recipient|
  json.extract! recipient, :id, :name, :birthday
  json.url recipient_url(recipient, format: :json)
end
