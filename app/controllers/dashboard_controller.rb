class DashboardController < ApplicationController
    before_action:authenticate_user!
    def index
        @uid= current_user.id
    end
    def search
        @user=User.where(username:search_params)
        if @user==[]
            flash[:notice]="No such user exists."
            redirect_to dashboard_path
        else
            redirect_to profile_path(@user[0].id)
        end
    end
    def search_params
        params.require(:username)
    end
end