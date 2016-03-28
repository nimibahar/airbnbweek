json.array!(@users) do |user|
  json.extract! user, :id, :fname, :lname, :bdate, :email, :encrypted_password, :photo_id
  json.url user_url(user, format: :json)
end
