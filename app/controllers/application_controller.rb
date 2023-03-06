class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  use Rack::Session::Cookie, :expire_after => 259200000000
  
  # To enable cross origin requests for all routes:
  set :bind, '0.0.0.0'
  configure do
    enable :cross_origin
  end
  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Headers'] = '*'
    response.headers["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS, PUT, DELETE"
  end
  
  # routes...
  options "*" do
    response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
    response.headers["Access-Control-Allow-Origin"] = "*"
    200
  end


  
    # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  # get all projects
  get '/projects' do
    projects = Project.all
    [200, projects.to_json]
  end

  # get all users
  get '/users' do
    users = User.all
    users.to_json
  end

  # get all projects for a user
  get '/user/projects/:id' do
    user = User.find(params[:id])
    # include associated projects in the JSON response
    user.to_json(include: :projects)
  end

  get '/project/users/:id' do
    project = Project.find(params[:id])
    # include associated projects in the JSON response
    project.to_json(include: :users)
  end

  # [x]Deliverable 1 - view all projects
  get '/projects' do
    projects = Project.all
    projects.to_json
  end

  # []Deliverable 2 - create a project and add details about it
  post '/project/create' do
    data = JSON.parse(request.body.read)
    begin
      project = Project.create(data)
      [201,project.to_json]
    rescue => exception
      [422, {
        "error": exception
    }.to_json]
    end
  end

  # []Deliverable 3 - Add other users as members of the project

  # []Deliverable 4 - Members should be able to update the status of the project

  # [x]Deliverable 5 - Delete a project
  delete '/project/destroy/:id' do 
    project = Project.find(params[:id])
    project.destroy
  end

  # []Deliverable 6 - get all status updates of the project




  post '/user/create' do
    # data = params[:password]
    # data = JSON.parse(request.body.read)
    begin
      user = User.create(name: params[:username], email: params[:email], password: params[:password])
      [201,user.to_json]
    rescue => exception
      [422, {
        "error": exception
      }.to_json]
    end
    # data["username"].to_json
  
  end
end

