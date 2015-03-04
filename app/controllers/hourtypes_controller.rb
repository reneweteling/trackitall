class HourtypesController < ApplicationController
  before_action :set_hourtype, only: [:show, :edit, :update, :destroy]

  # GET /hourtypes
  # GET /hourtypes.json
  def index
    @hourtypes = Hourtype.all
  end

  # GET /hourtypes/1
  # GET /hourtypes/1.json
  def show
  end

  # GET /hourtypes/new
  def new
    @hourtype = Hourtype.new
  end

  # GET /hourtypes/1/edit
  def edit
  end

  # POST /hourtypes
  # POST /hourtypes.json
  def create
    @hourtype = Hourtype.new(hourtype_params)

    respond_to do |format|
      if @hourtype.save
        format.html { redirect_to @hourtype, notice: 'Hourtype was successfully created.' }
        format.json { render :show, status: :created, location: @hourtype }
      else
        format.html { render :new }
        format.json { render json: @hourtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hourtypes/1
  # PATCH/PUT /hourtypes/1.json
  def update
    respond_to do |format|
      if @hourtype.update(hourtype_params)
        format.html { redirect_to @hourtype, notice: 'Hourtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @hourtype }
      else
        format.html { render :edit }
        format.json { render json: @hourtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hourtypes/1
  # DELETE /hourtypes/1.json
  def destroy
    @hourtype.destroy
    respond_to do |format|
      format.html { redirect_to hourtypes_url, notice: 'Hourtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hourtype
      @hourtype = Hourtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hourtype_params
      params.require(:hourtype).permit(:name, :billable, :price_id)
    end
end
