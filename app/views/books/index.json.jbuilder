json.array!(@books) do |book|
  json.extract! book, :id, :title, :author, :isbn, :image, :is_active, :is_approved
  json.url book_url(book, format: :json)
end
