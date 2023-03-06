class MemberController < ApplicationController 
    post '/member/create' do
        begin
            project_member = Member.create(
              user_id: params[:user_id],
              project_id: params[:project_id]
            )
      
            [201,
            project_member.to_json(include: [:project, :user])]
          rescue exception
            [401,
            {error: exception}.to_json]
          end    
    end
end