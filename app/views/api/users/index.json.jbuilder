json.set! :users do
  json.array! @users do |user|
    json.extract! user,:name
  end
end