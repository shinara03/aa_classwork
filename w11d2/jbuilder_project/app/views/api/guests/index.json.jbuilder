# json.guest do
@guests.each do |guest|
  json.extract! guest, :name
end
# end
