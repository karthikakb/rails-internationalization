class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  # GET /feedbacks
  # GET /feedbacks.json
  def index
    @feedbacks = if params[:author_q]
      Feedback.search params[:author_q]
    else
      Feedback.all
    end
  end

  # GET /feedbacks/1
  # GET /feedbacks/1.json
  def show
    @feedbacks = Feedback.find(params[:id])
  end

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
    @feedbacks = Feedback.order created_at: :desc
  end

  # GET /feedbacks/1/edit
  def edit
    @feedback = Feedback.find(params[:id])

  end

  # POST /feedbacks
  # POST /feedbacks.json
  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      redirect_to feedbacks_path
    else
      @feedbacks = Feedback.order created_at: :desc
      render new
    end
  end

  # PATCH/PUT /feedbacks/1
  # PATCH/PUT /feedbacks/1.json
  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to feedbacks_path, notice: 'Feedback was successfully updated.' }
        format.json { render :index, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feedbacks/1
  # DELETE /feedbacks/1.json
  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Feedback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_feedback
    @feedback = Feedback.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def feedback_params
    locale_params = I18n.available_locales.map do |local|
      [:"author_#{Mobility.normalize_locale(local)}", :"message_#{Mobility.normalize_locale(local)}"]
    end.flatten
    params.require(:feedback).permit(locale_params)
  end
end
