class PrefixesController < ApplicationController
  before_action :set_prefix, only: %i[ show edit update destroy ]

  # GET /prefixes or /prefixes.json
  def index
    @prefixes = Prefix.all
  end

  # GET /prefixes/1 or /prefixes/1.json
  def show
  end

  # GET /prefixes/new
  def new
    @prefix = Prefix.new
  end

  # GET /prefixes/1/edit
  def edit
  end

  # POST /prefixes or /prefixes.json
  def create
    @prefix = Prefix.new(prefix_params)

    respond_to do |format|
      if @prefix.save
        format.html { redirect_to @prefix, notice: "Prefix was successfully created." }
        format.json { render :show, status: :created, location: @prefix }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prefix.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prefixes/1 or /prefixes/1.json
  def update
    respond_to do |format|
      if @prefix.update(prefix_params)
        format.html { redirect_to @prefix, notice: "Prefix was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @prefix }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prefix.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prefixes/1 or /prefixes/1.json
  def destroy
    @prefix.destroy!

    respond_to do |format|
      format.html { redirect_to prefixes_path, notice: "Prefix was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prefix
      @prefix = Prefix.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def prefix_params
      params.expect(prefix: [ :name ])
    end
end
