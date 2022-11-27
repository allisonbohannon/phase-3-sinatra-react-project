class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/books" do
    books = Book.all
    books.to_json
  end

  post "/books" do 
    author = Author.find_or_create_by(
      first_name: params[:first_name]
      last_name: params[:last_name]
    )

    genre = Genre.find_or_create_by(
      genre: params[:genre]
    )

    book = Book.find_or_create_by(
      title: params[:title]
      author_id: author.id, 
      genre_id: genre.id
    )
    book.to_json
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
