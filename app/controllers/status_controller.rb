class StatusController < ApplicationController
    post "/project/status/update" do
        begin
          # authorized
          project_status = Status.create(
            summary: params[:summary],
            details: params[:details],
            project_id: params[:project_id]
          )
    
          status 201
          project_status.to_json
        rescue exception
          [401,
          {error: exception}.to_json]
        end   
      end 

    get '/project/status/all/:id' do 
        begin
            status = Status.where(project_id: params[:id]).order(create_at: :desc)
            status.to_json
          rescue exception
            [401,
            {error: "Unauthorized"}.to_json]
          end
    end
end