class Library

  attr_reader :name,
              :books,
              :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
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

end
