class AttendancesController < ApplicationController
    
    
    def create
        @user = User.find(params[:user_id])
        @attendance = @user.attendances.find_by(worked_on: Date.today)
        if @attendance.started_at.nil?
            @attendance.update_attributes(started_at: current_time)
         flash[:info] = 'おはようございます。'
         
        elsif @attendance.finished_at.nil?
        @attendance.update_attributes(finished_at: current_time)
        flash[:info] = 'おつかれさまでした。'
        else
         flash[:danger] = 'トラブルがあり、登録出来ませんでした。'
        end
     redirect_to @user
    end
    
    
    def edit
    @user = User.find(params[:id])
    @first_day = first_day(params[:date])
    @last_day = @first_day.end_of_month
    @dates = user_attendances_month_date
    end
    
    def update
        @user = User.find(params[:id])
        attendances_params.each do |id, item|
            attendance = Attendance.find(id)
            attendance.update_attributes(item)
    end
    flash[:success] = '勤怠情報を更新しました。'
    redirect_to user_url(@user, params:{first_day: params[:date]})
    end
    
    private
    def attendances_params
        params.permit(attendances: [:started_at, :finished_at, :note])[:attendances]
    end
end