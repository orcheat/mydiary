class DiariesController < ApplicationController
  before_action :set_diary, only: %i[ show edit update destroy ]

  # GET /diaries or /diaries.json
  def index
    @diaries = Diary.all
  end

  # GET /diaries/1 or /diaries/1.json
  def show
  end

  # GET /diaries/new
  def new
    @diary = Diary.new
  end

  # GET /diaries/1/edit
  def edit
  end

  # POST /diaries or /diaries.json
  def create
    @diary = Diary.new(diary_params)

    respond_to do |format|
      if @diary.save
        format.html { redirect_to @diary, notice: "Diary was successfully created." }
        format.json { render :show, status: :created, location: @diary }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @diary.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /diaries/1 or /diaries/1.json
  def update
    respond_to do |format|
      if @diary.update(diary_params)
        format.html { redirect_to @diary, notice: "Diary was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @diary }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @diary.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /diaries/1 or /diaries/1.json
  def destroy
    @diary.destroy!

    respond_to do |format|
      format.html { redirect_to diaries_path, notice: "Diary was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary
      @diary = Diary.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def diary_params
      params.expect(diary: [ :title, :description, :color, :user_id ])
    end
end
