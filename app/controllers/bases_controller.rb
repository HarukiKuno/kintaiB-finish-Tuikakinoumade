class BasesController < ApplicationController
  def index
    @bases = Base.all
  end
  
  def edit_base_info
  end
  
  
  def new
    @base = Base.new
  end
  
  
  
  def create
    @base = Base.new(base_params)
    if @base.save
      flash[:success] = '拠点を追加しました。'
      redirect_to bases_url
    else
      redirect_to bases_url
    end
  end
  
  
  def destroy
    @base = Base.find(params[:id])
    @base.destroy
    flash[:success] = "拠点【#{@base.basename}】のデータを削除しました。"
    redirect_to bases_url
  end
  
  
  
  def update_base_info
    @base.update_attributes(base_params)
  end
  
  private
  
  def base_params
    params.require(:base).permit(:basenumber, :basename, :basetype)
  end
  
end
