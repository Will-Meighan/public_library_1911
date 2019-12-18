class Library

  attr_reader :name,
              :books,
              :authors,
              :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
  end

  def add_author(author)
    @authors << author
    @books = @authors.map { |author| author.books }.flatten
  end

  def publication_time_frame_for(author)
    publication_years = author.books.map { |book| book.publication_year }

    new_hash = {start: publication_years.min, end: publication_years.max}

    new_hash
  end

  def checkout(book)
    if @books.include?(book)
      @books.delete(book)
      @checked_out_books << book
      book.count += 1
      true
    else
      false
    end
  end

  def return(book)
    @books << book
    @checked_out_books.delete(book)
  end

  def most_popular_book
    all_books = @books + @checked_out_books
    all_books.max_by { |book| book.count }
  end

end
