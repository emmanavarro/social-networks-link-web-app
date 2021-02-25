json.extract! user, :id, :first_name, :last_name, :phone, :email, :country, :city, :bio, :created_at, :updated_at
json.url user_url(user, format: :json)
