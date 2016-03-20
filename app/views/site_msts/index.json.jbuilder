json.array!(@site_msts) do |site_mst|
  json.extract! site_mst, :id, :contents_name, :home_url, :base_url
  json.url site_mst_url(site_mst, format: :json)
end
