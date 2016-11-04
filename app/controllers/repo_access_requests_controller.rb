class RepoAccessRequestsController < ApplicationController
  before_action :authenticate_user!
  # GET /repo_access_requests
  # GET /repo_access_requests.json
  def index
    @repo_access_requests = RepoAccessRequest.all
  end

  # GET /repo_access_requests/1
  # GET /repo_access_requests/1.json
  def show
    @repo_access_request = RepoAccessRequest.find(params[:id])
  end

  # GET /repo_access_requests/new
  def new
    @repo_access_request = current_user.repo_access_requests.new
  end

  # GET /repo_access_requests/1/edit
  def edit
    @repo_access_request = current_user.repo_access_requests.find(params[:id])
  end

  # POST /repo_access_requests
  # POST /repo_access_requests.json
  def create
    @repo_access_request = current_user.repo_access_requests.new(repo_access_request_params)
    respond_to do |format|
      if @repo_access_request.save
        format.html { redirect_to @repo_access_request, notice: 'Repo access request was successfully created.' }
        format.json { render :show, status: :created, location: @repo_access_request }
      else
        format.html { render :new }
        format.json { render json: @repo_access_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repo_access_requests/1
  # PATCH/PUT /repo_access_requests/1.json
  def update
    @repo_access_request = current_user.repo_access_requests.find(params[:id])
    respond_to do |format|
      if @repo_access_request.update(repo_access_request_params)
        format.html { redirect_to @repo_access_request, notice: 'Repo access request was successfully updated.' }
        format.json { render :show, status: :ok, location: @repo_access_request }
      else
        format.html { render :edit }
        format.json { render json: @repo_access_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repo_access_requests/1
  # DELETE /repo_access_requests/1.json
  def destroy
    @repo_access_request = current_user.repo_access_requests.find(params[:id])
    @repo_access_request.destroy
    respond_to do |format|
      format.html { redirect_to repo_access_requests_url, notice: 'Repo access request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_repo_access_request
      @repo_access_request = RepoAccessRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repo_access_request_params
      params.require(:repo_access_request).permit(:user_id, :repository, :repo_group, :level, :request_action)
    end
end
