json.array!(@dance_classes) do |dance_class|
  json.extract! dance_class, :id
  json.url dance_class_url(dance_class, format: :json)
end
