class SearchController < ApplicationController
before_action :authenticate_user!

def search

@model = params[:model]
@content = params[:word]
@method = params[:search]
@option = "search"
@book = Book.new
if @model == 'user'
	@records = User.search_for(@content, @method)
else
	@records = search_for(@content, @method)
end
end


private
def search_for(content,method)
if params[:word].present? && params[:model] === "Book" && params[:search] === "perfect"
   @books = Book.where('title LIKE ?', "#{params[:word]}")

elsif params[:word].present? && params[:model] === "Book" && params[:search] === "front"
	@books = Book.where('title LIKE ?', "#{params[:word]}%")

elsif params[:word].present? && params[:model] === "Book" && params[:search] === "back"
	@books = Book.where('title LIKE ?', "%#{params[:word]}")

# elsif params[:word].present? && params[:model] === "Book" && params[:search] === "part"
else
	@books = Book.where('title LIKE ?', "%#{params[:word]}%")
end

if params[:word].present? && params[:model] === "User" && params[:search] === "perfect"
	@users = User.where('name LIKE ?', "#{params[:word]}")

elsif params[:word].present? && params[:model] === "User" && params[:search] === "front"
	@users = User.where('name LIKE ?', "#{params[:word]}%")

elsif params[:word].present? && params[:model] === "User" && params[:search] === "back"
	@users = User.where('name LIKE ?', "%#{params[:word]}")

# elsif params[:word].present? && params[:model] === "User" && params[:search] === "part"
else
	@users = User.where('name LIKE ?', "%#{params[:word]}%")

end
end
end


