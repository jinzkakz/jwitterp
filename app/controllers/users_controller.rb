class UsersController < ApplicationController
	def new 
		@user = User.new
	end

	def create
        @user = User.check(params[:user][:email])
        
        if @user == nil
            @user = User.create(allowed_params)
            redirect_to root_path
        else
            render json: { error: 'Email already exist, please try another one'}
        end
        #########################
#        @user = User.new(allowed_params)
#		if @user.save
#			redirect_to login_path, notice: 'Thanks for signing up! Please log in to access! Thanks'
#		else
#			render :new
#		end
        session[:user_id] = @user.id
	end

	private

	def allowed_params
	  params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
