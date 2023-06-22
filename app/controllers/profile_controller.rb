class ProfileController < ApplicationController
    before_action:authenticate_user!
    def info
        @user=User.find(params[:id])
        @follow=Follow.where(user_id: params[:id])
    end
    def followers
        @user=User.find(params[:id])
        @follow=Follow.where(user_id: params[:id])
    end
    def following
        @user=User.find(params[:id])
        @follow=Follow.where(user_id: params[:id])
    end
    def follow
        @user=User.find(params[:id])
        if Follow.where(user_id:current_user.id,following_id:@user.id)==[]
            Follow.create(user_id:current_user.id, following_id:@user.id).save!
        end
        redirect_to profile_path(@user)
    end
    def unfollow
        @user=User.find(params[:id])
        if Follow.where(user_id:current_user.id,following_id:@user.id)!=[]
            Follow.delete_by(user_id:current_user.id, following_id:@user.id)
        end
        redirect_to profile_path(@user)
    end
end