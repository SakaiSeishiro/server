class UsersController < ApplicationController

    def show
        @user = User.find(params[:id])
        @post = Post.where(params[:id])
        respond_to do |f|
            f.json { render json: {post: @post, user: @user }}
        end
    end

    def create
        password = user_params[:password]
        secure_password = password.crypt("secretkey")
        @user = User.create(user_params.merge(password: secure_pass(password), image_name: "default_user.jpg"))
        if @user.save
            render :json => @user 
        else 
            render :create 
        end 
    end

    def update
        @user = User.find(params[:id])
        if params[:image]
            @user.image_name = "#{@user.id}.jpg"
            image = params[:image]
            File.binwrite("public/user_image/#{@user.image_name}", image.read)
        end

        if @user.update(user_params)
            render :update
        else
            render :update
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    private

    def login
        @user = User.find_by(user_name: params[:user_name], password: params[:password])
        if @user
          redirect_to("/posts/index")
        else
            @error_message = "ユーザーネームまたはパスワードが間違っています"
            @user_name = params[:user_name]
            @password = params[:password]
            render("users/login")        
        end
    end

    def user_params
        params.require(:user).permit(:name, :job, :profile, :password, :user_name, :image_name)
    end

end
