json.array!(@word_rank_infos) do |word_rank_info|
  json.extract! word_rank_info, :id, :word, :site_id, :count
  json.url word_rank_info_url(word_rank_info, format: :json)
end
