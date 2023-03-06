class SessionsController < ApplicationController
    post '/user/login' do 
        user = User.find_by(name: params[:email])
        password = params[:password]
        if user && user.password == password
           session[:user_id] = user.id
           user.to_json
        else
           {error: "No account associated with those credentials. Please try again."}.to_json
        end
    end

    delete "/logout" do
        begin
          # authorized
          session.delete :user_id
          status 204
        rescue exception
          status 401
          {error: exception}.to_json
        end
    end
end