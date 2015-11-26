json.array!(@docs) do |doc|
  json.extract! doc, :id, :nome
  json.url doc_url(doc, format: :json)
end
