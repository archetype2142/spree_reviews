class Spree::Admin::ReviewsController < Spree::Admin::ResourceController
  helper Spree::ReviewsHelper

  def index
    @reviews = collection
  end
  
  def destroy
    puts "TRY TO DESTROY"
  end
  
  def approve
    review = Spree::Review.find(params[:id])
    if review.update_attribute(:approved, true)
      #curr_product = review.product
      #reviews = curr_product.reload.reviews.approved

      #curr_product.update!(reviews_count: reviews.count)
      #curr_product.update!(avg_rating: reviews.sum(:rating).to_f / reviews.count)
        
      flash[:notice] = Spree.t(:info_approve_review)
    else
      flash[:error] = Spree.t(:error_approve_review)
    end
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
