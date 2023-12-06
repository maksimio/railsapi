before do
  content_type 'application/json'
end

def collection_to_api(collection)
  JSON.dump(collection)#.map{|s| s.to_api})
end