json.array!(@word_msts) do |word_mst|
  json.extract! word_mst, :id, :word, :site_id, :url, :count
  json.url word_mst_url(word_mst, format: :json)
end
