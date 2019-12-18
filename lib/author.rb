class Author

  attr_reader :first_name,
              :last_name,
              :books

  def initialize(info)
    @first_name = info[:first_name]
    @last_name = info[:last_name]
    @books = []
  end

  def write(title, date)
    new_book = Book.new({
                author_first_name: @first_name,
                author_last_name: @last_name,
                title: title,
                publication_date: date
                })

    @books << new_book

    new_book
  end

end
