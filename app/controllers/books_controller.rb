class BooksController < ApplicationController
  def create
    @books = Book.all#modelの処理はコントローラで行うのでここで定義している
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id)
      flash[:success] = "Book was successfully created."
    else
      render :index
    end
  end
  def index
    @books = Book.all#Bookモデルとやり取りをしているデータ全てを取得するallメソッド
    @book = Book.new#新規投稿用の箱を作るためのnewメソッド
  end
  def show
    @book = Book.find(params[:id])#データベースからlistsテーブルに保存されているデータをfindメソッドで一つだけ取得する
                                  #findメソッドはテーブルのidカラムとparamsのidを比較して合致するレコードを取得するメソッド
  end

  def edit
    @book = Book.find(params[:id])#データベースからlistsテーブルに保存されているデータをfindメソッドで一つだけ取得する
  end
  def update
    @book = Book.find(params[:id])#変更したいレコードを取得して@bookに代入
    if @book.update(book_params)#まずbook_paramsメソッドが実行されてparams.require(:book).permit(:title, :body)を返す。変更する値のハッシュのようなもの{title: "~", body: "~"}を返して
      redirect_to book_path(@book.id)#それを引数として@bookがupdateメソッドをする実行する。
      flash[:updated] = "Book was successfully updated."
    else
      render :edit
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed."
  end
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
