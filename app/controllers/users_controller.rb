class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        #this creates a user with the parameters, 
        #if a user saved successfully, it redirects back to new user form,
        #which will be blank. If you don't, it will render the new form
        #again
        #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
        
        @user = User.new(user_params)

        if @user.save
        redirect_to new_user_path
        else
        render :new
        end
    end

    def edit
        #find a user based on the submitted params id
        @user = User.find(params[:id])
    end

    private
    def user_params
        #whitelists those three parameters, deletes everything else.
        #returns the parameters
        params.require(:user).permit(:username, :password, :email)
    end
end
