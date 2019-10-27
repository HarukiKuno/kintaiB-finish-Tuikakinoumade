class BasesController < ApplicationController
  def index
    @bases = Base.all
  end
  
  def edit_base_info
  end
  
  
  def new
   if params[:id].present?
   @base = Base.find(params[:id])
   else
    @base = Base.new
   end
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
  
  
  
  def update
    @base = Base.find(params[:id])
    @base.update_attributes(base_params)
    flash[:success] = '拠点情報を更新しました。'
    redirect_to request.referer
  end
  
  private
  
  def base_params
    params.require(:base).permit(:basenumber, :basename, :basetype)
  end
  
end
