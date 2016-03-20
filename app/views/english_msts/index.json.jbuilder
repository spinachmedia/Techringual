json.array!(@english_msts) do |english_mst|
  json.extract! english_mst, :id, :word, :mean, :valid
  json.url english_mst_url(english_mst, format: :json)
end
