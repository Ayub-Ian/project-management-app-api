class ProjectController < ApplicationController
    post '/project/create' do
        status = "in-progress"
        begin
            project = Project.create(name: params[:name], description: params[:description], category: params[:category])
            [201,project.to_json(include: [:statuses, :users])]
          rescue => exception
            [422, {
              "error": exception
            }.to_json]
          end
    end

    get '/projects' do
        projects = Project.all
        projects.to_json(include: :users)
    end

    get '/project/:id' do
        project_id = params["id"].to_i
        projects = Project.find(project_id)
        projects.to_json
    end

    delete "/project/destroy/:id" do
      begin
        # authorized
        project = Project.find(params[:id])
        project.destroy
        
        status 204
      rescue exception
        [401,
        {error: "Unauthorized"}.to_json]
      end
    end


end