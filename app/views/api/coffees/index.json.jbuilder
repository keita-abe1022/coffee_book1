json.set! :coffees do
  json.array! @coffees do |coffee|
    json.extract! coffee, :id, :product_name, :shop
  end
end