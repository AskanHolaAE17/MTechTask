# frozen_string_literal: true

require 'csv'

# Handler for Import
class ImportsController < ApplicationController
  before_action :set_import, only: %i[import_process show edit update destroy]

  def index
    @imports = Import.all
    HardWorker.perform_async('Hard Worker works')
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
    users = []
    ImportDataUpdater.update_after_started(@import)

    CSV.foreach(@import.file.path, headers: true).with_index do |row, index|
      row_hash = row.to_h
      row_hash['import_id'] = @import.id

      # The day is put on the first place
      # to make the data valid for saving in DB
      row_hash = make_the_date_valid(row_hash)

      user = User.new(row_hash)

      if user.valid?
        users << row_hash
        @import.count_of_created_users += 1

      else
        @import.count_of_not_created_users += 1
      end

      @import.save if (index % 10).zero?
    end

    ImportDataUpdater.update_after_completed(@import)

    User.import(users)

    render :show
  end

  def import_process
    @percentage = if @import.count_of_lines_in_csv.positive?
                    (@import.count_of_created_users +
                     @import.count_of_not_created_users).to_f /
                      @import.count_of_lines_in_csv *
                      100
                  else
                    0
                  end

    @percentage = @percentage.to_i
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
