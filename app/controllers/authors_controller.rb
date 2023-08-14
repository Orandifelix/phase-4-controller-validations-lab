class AuthorsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)

    render json: author, status: :created
  end

  private

  def unprocessable_entity(invalid)
    render json: {error:invalid.record.errors.full_messages }, status: :unprocessable_entity
  end
  
  def author_params
    params.permit(:email, :name)
  end
  
end
