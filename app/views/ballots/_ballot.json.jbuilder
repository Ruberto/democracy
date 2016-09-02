json.extract! ballot, :id, :ip_address, :name, :created_at, :updated_at
json.url ballot_url(ballot, format: :json)