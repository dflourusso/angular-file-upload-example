class Api::DocsController < ApplicationController
  before_action :set_doc, only: [:show, :edit, :update, :destroy]

  # GET /docs
  # GET /docs.json
  def index
    render json: @docs = Doc.all.as_json(include: :anexos)
  end

  # GET /docs/1
  # GET /docs/1.json
  def show
    render json: @doc
  end

  # GET /docs/new
  def new
    @doc = Doc.new
    render json: @doc.as_json(include: :anexos)
  end

  # GET /docs/1/edit
  def edit
    render json: @doc
  end

  # POST /docs
  # POST /docs.json
  def create
    @doc = Doc.new(doc_params)

    if @doc.save
      render json: @doc
    else
      render json: @doc.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /docs/1
  # PATCH/PUT /docs/1.json
  def update
    respond_to do |format|
      if @doc.update(doc_params)
        format.html { redirect_to @doc, notice: 'Doc was successfully updated.' }
        format.json { render :show, status: :ok, location: @doc }
      else
        format.html { render :edit }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/1
  # DELETE /docs/1.json
  def destroy
    @doc.destroy

    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doc
      @doc = Doc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doc_params
      p = params.permit(:nome, anexos: [:file])
      p[:anexos_attributes] = p.delete :anexos if p[:anexos]
      p
    end
end
