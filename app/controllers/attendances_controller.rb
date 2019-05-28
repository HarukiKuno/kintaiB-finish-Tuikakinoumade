class AttendancesController < ApplicationController
    
    
    def create
        @user = User.find(params[:user_id])
        @attendance = @user.attendances.find_by(worked_on: Date.today)
        if @attendance.started_at.nil?
            @attendance.update_attributes(started_at: Time.new(
                Time.now.year,
                Time.now.month,
                Time.now.day,
                Time.now.hour,
                Time.now.min, 0)
                )
         flash[:info] = 'おはようございます。'
        else
         flash[:danger] = 'トラブルがあり、登録出来ませんでした。'
        end
     redirect_to @user
    end
end
