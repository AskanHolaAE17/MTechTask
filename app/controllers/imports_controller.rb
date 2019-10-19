require 'csv'

class ImportsController < ApplicationController

  before_action :set_import, only: [:show, :edit, :update, :destroy]

  def index
    @imports = Import.all
  end
  
  
  def show
  end  
  
  
  def new
    @import = Import.new
  end
  
  
  def edit
  end    
  
  
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
    CSV.foreach(@import.file.path, headers: true) do |row|      
      row_hash = row.to_h
      row_hash["import_id"] = @import.id 
            
      # The day is put on the first place 
      # to make the data valid for saving in DB
      
      if row_hash['date_of_birth']
        date = row_hash['date_of_birth'].split('/')
        row_hash['date_of_birth'] = date[1] + '/' + date[0] + '/' + date[2]
      end
      
      user = User.new(row_hash)

      if user.valid?     
        users << row_hash       
      end
    end    
    User.import(users)  
    
    render :show
  end 
  
  
  def show      
  
  end
  
  
  def destroy
    @import.destroy
    respond_to do |format|
      format.html { redirect_to imports_url, notice: 'Import was successfully destroyed.' }
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
