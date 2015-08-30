class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  # GET /forms
  # GET /forms.json
  def index
    if orange_signed_in?
      @title = 'Moksleivių'
      @forms = Form.all
    elsif student_signed_in?
      @title = 'Tavo'
      @forms = current_student.forms
    else
      redirect_to root_url, alert: 'Negalite peržiūrėti šių anketų!'
    end
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
    if !(student_authorized? or orange_signed_in?)
      redirect_to root_url, alert: 'Negalite peržiūrėti šios anketos!'
    end
  end

  # GET /forms/new
  def new
    if !student_signed_in?
      redirect_to root_url, alert: 'Anketas gali kurti tik moksleiviai!'
      return
    end
    @form = Form.new
  end

  # GET /forms/1/edit
  def edit
    if !student_authorized?
      redirect_to root_url, alert: 'Negalite redaguoti šios anketos!'
    end
  end

  # POST /forms
  # POST /forms.json
  def create
    if !student_signed_in?
      format.html { redirect_to root_url, notice: 'Anketas gali kurti tik moksleiviai!' }
      format.json { render json: 'Anketas gali kurti tik moksleiviai!', status: :unauthorized }
      return
    end

    @form = Form.new(form_params)
    @form.student_id = current_student.id

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Anketa buvo sėkmingai sukurta.' }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  def update
    if !student_authorized?
      redirect_to root_url, alert: 'Negalite redaguoti šios anketos!'
    end

    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    if !student_authorized?
      format.html { redirect_to root_url, alert: 'Negalite ištrinti šios anketos!' }
      format.json { render json: 'Negalite ištrinti šios anketos!', status: :unauthorized }
    end

    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: 'Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      params[:form]
    end

    def student_authorized?
      (student_signed_in? and @form.student == current_student)
    end
end
