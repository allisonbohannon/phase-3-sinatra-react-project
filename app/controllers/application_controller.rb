class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/books" do
    books = Book.all
    books.to_json
  end

  post "/books" do 
    book = Book.create(
      title: params[:title]
    )
  end

  patch '/books/:id' do 
    book = Book.find(params[:id])
    book.to_json
  end

  delete '/books/:id' do
    book = Book.find(params[:id])
    book.destroy
    book.to_json
  end

end
