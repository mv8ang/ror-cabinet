class DocumentsController < ApplicationController
  before_action :find_document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = Document.all.order("created_at DESC")
  end
  
  def show
    # see before_action
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to @document
    else
      render 'new'
    end
  end

  def edit
    # see before_action
  end

  def update
    # see before_action
  end

  def destroy
    # see before_action
  end

  private

    def find_document
      @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:title, :content)
    end
  
end
