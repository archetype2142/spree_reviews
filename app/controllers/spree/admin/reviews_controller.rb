class Spree::Admin::ReviewsController < Spree::Admin::ResourceController
  helper Spree::ReviewsHelper

  def index
    @reviews = collection
  end
  
  def destroy
    review = Spree::Review.find(params[:id])
    
    if review.destroy
      flash[:notice] = "Deleted!"
    else
      flash[:error] = "Can't Delete"
    end
  end
  
  def approve
    review = Spree::Review.find(params[:id])
    review.update!(approved: true)
#     if 
#       #curr_product = review.product
#       #reviews = curr_product.reload.reviews.approved

#       #curr_product.update!(reviews_count: reviews.count)
#       #curr_product.update!(avg_rating: reviews.sum(:rating).to_f / reviews.count)
        
<<<<<<< HEAD
      flash[:notice] = Spree.t(:info_approve_review)
    else
      flash[:error] = review.errors
    end
=======
#       flash[:notice] = Spree.t(:info_approve_review)
#     else
#       flash[:error] = review.errors
#     end
>>>>>>> 9946b6dfdc95dccd462f0b5e85e78fb9cc7ed510
    redirect_to admin_reviews_path
  end

  def edit
    return if @review.product
    flash[:error] = Spree.t(:error_no_product)
    redirect_to admin_reviews_path
  end

  private

  def collection
    params[:q] ||= {}
    @search = Spree::Review.ransack(params[:q])
    @collection = @search.result.includes([:product, :user, :feedback_reviews]).page(params[:page]).per(params[:per_page])
  end
end
