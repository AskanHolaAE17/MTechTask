# frozen_string_literal: true

# Handler for Import
class ImportsController < ApplicationController
  before_action :set_import, only: %i[import_process show edit update destroy]

  def index
    @imports = Import.all
  end

  def new
    @import = Import.new
  end

  def edit; end

  def create
    @import = Import.create(import_params)

    respond_to do |format|
      if @import.save
        format.html { render :edit }
        format.json { render :edit, status: :created, location: @import }
      else
        format.html { render :new }
        format.json { render json: @import.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    CsvWorker.perform_async(@import.id)

    render :show
  end
  
  def show; end  

  def destroy
    @import.users.destroy_all
    @import.destroy
    respond_to do |format|
      format.html { redirect_to imports_url, notice: 'Import and associated Users were successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_import
    @import = Import.find(params[:id])
  end

  def import_params
    params.require(:import).permit(:title, :file)
  end
end
