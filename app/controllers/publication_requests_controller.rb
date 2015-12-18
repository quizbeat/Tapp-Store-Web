class PublicationRequestsController < ApplicationController
  before_action :set_publication_request, only: [:show, :edit, :update, :destroy]

  # GET /publication_requests
  # GET /publication_requests.json
  def index
    @publication_requests = PublicationRequest.all
  end

  # GET /publication_requests/1
  # GET /publication_requests/1.json
  def show
  end

  # GET /publication_requests/new
  def new
    @publication_request = PublicationRequest.new
  end

  # GET /publication_requests/1/edit
  def edit
  end

  # POST /publication_requests
  # POST /publication_requests.json
  def create
    @publication_request = PublicationRequest.new(publication_request_params)

    respond_to do |format|
      if @publication_request.save
        format.html { redirect_to @publication_request, notice: 'Publication request was successfully created.' }
        format.json { render :show, status: :created, location: @publication_request }
      else
        format.html { render :new }
        format.json { render json: @publication_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publication_requests/1
  # PATCH/PUT /publication_requests/1.json
  def update
    respond_to do |format|
      if @publication_request.update(publication_request_params)
        format.html { redirect_to @publication_request, notice: 'Publication request was successfully updated.' }
        format.json { render :show, status: :ok, location: @publication_request }
      else
        format.html { render :edit }
        format.json { render json: @publication_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publication_requests/1
  # DELETE /publication_requests/1.json
  def destroy
    @publication_request.destroy
    respond_to do |format|
      format.html { redirect_to publication_requests_url, notice: 'Publication request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication_request
      @publication_request = PublicationRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_request_params
      params.require(:publication_request).permit(:app_id, :moderator_id, :status, :request_date)
    end
end
