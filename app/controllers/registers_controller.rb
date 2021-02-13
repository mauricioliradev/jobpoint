class RegistersController < ApplicationController
  before_action :set_register, only: [:show, :edit, :update, :destroy]
  # GET /registers
  def index
    @filterrific = initialize_filterrific(
      Register,
      params[:filterrific]
    ) or return
    @registers = @filterrific.find.order(created_at: :desc).page(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /registers/1
  def show
  end

  # GET /registers/new
  def new
    @register = Register.new
  end

  # GET /registers/1/edit
  def edit
  end

  # POST /registers
  def create
    @register = Register.new(register_params)
    register = Register.where(user_id: register_params[:user_id], kind: register_params[:kind], date: register_params[:date].to_date.beginning_of_day..register_params[:date].to_date.end_of_day ).count
    puts "testeeeeeee"
    puts register
    puts "testtttttt"
      if register == 0 
        respond_to do |format|
          if @register.save
            format.html { redirect_to registers_path, notice: t('controllers.registers.created') }
            format.json { render :show, status: :created, location: @register }
          else
            format.html { render :new }
            format.json { render json: @register.errors, status: :unprocessable_entity }
          end
        end
      else 
        respond_to do |format|
          format.html { redirect_to request.referer, alert: "Atenção, você já registrou seu ponto de #{Register.get_human_kinds(register_params[:kind].to_i)} hoje!" }
        end
      end
  end

    # PATCH/PUT /registers/1
  def update
    respond_to do |format|
      if @register.update(register_params)
        format.html { redirect_to @register, notice: t('controllers.registers.updated') }
        format.json { render :show, status: :ok, location: @register }
      else
        format.html { render :edit }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1
  def destroy
    @register.destroy
    respond_to do |format|
      format.html { redirect_to registers_url, notice: t('controllers.registers.destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_params
      params.require(:register).permit(:user_id, :kind, :date, :description)
    end
end
