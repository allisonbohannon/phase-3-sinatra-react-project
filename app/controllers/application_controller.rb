class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/books" do
    books = Book.all.order(:title)
    books.to_json(only: [:id, :title, :read_status], include: [:author, :genre])
  end

  # get "/books/:id" do
  #   book = Book.find(params[:id])
  #   book.to_json(only: [:id, :title, :read_status], include: [:author, :genre])
  # end

  post "/books" do 
    author = Author.find_or_create_by(
      first_name: params[:first_name],
      last_name: params[:last_name]
    )

    genre = Genre.find_or_create_by(
      genre: params[:genre]
    )

    book = Book.find_or_create_by(
      title: params[:title],
      author_id: author.id, 
      genre_id: genre.id,
      read_status: 0
    )
    book.to_json(only: [:id, :title, :read_status], include: [:author, :genre])
  end

  patch '/books/:id' do 
    book = Book.find(params[:id])
    book.update(
      read_status: 1
    )
    book.to_json(only: [:id, :title, :read_status], include: [:author, :genre])
  end

  delete '/books/:id' do
    book = Book.find(params[:id])
    book.destroy
  #  book.to_json(only: [:id, :title, :read_status], include: [:author, :genre])
  end

end
