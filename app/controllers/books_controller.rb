class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :reserve]
  
  def index
    if user_signed_in?
      @book = Book.all
    else
      @book = Book.all
    end
  end

  def myreserve
  @reserve = Reserve.where(user_id:current_user.id)
  end

  def destroy
    @reserve = Reserve.find(params[:id])
    if @reserve.destroy
      @reserve = Reserve.all.order(updated_at: :desc)
      respond_to do |format|
        format.js {render nothing: true}
      end
    end
  end

  def buy
  
     @reserve = Reserve.where(user_id:current_user.id)
    
  end

def buye
@buy = Buy.all
end

  def buyed
    logger.info(params[:user_id])
    buy = Buy.new(reserve_id: params[:book_idx], user_id: params[:user_id])
    if buy.save
      respond_to do |format|
        format.html {redirect_to buye_path,notice: "Your buy was book. congrats!"}
      else
        format.html {redirect_to root_path,notice: "fail"}
      end
    end
  end


  def reserve
    logger.info (params)
    reserve = Reserve.create(book_id: params[:id], user_id: current_user.id)
    if reserve.save!
      respond_to do |format|
        format.html {redirect_to root_path,notice: "Your book was reserved. congrats!"}
      else
        format.html {render :index}
      end
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, user_ids:[])
  end
end
