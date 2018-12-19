module Api
	module V1
		class SchoolsController < ApplicationController
			before_action :set_school, only: [:show, :destroy, :update]
			before_action :authenticate_user!

   #       
			def show
				current_user
				render json: @school
			end

			def index
		        @schools = School.all
                render json: @schools
            end
					 
			 def create
			    @school = School.new(school_params)

			    if @school.save
			      render json: @school
			    else
			      render json: @school.errors, status: :unprocessable_entity
			    end
            end

			def update
			    if @school.update_attributes(school_params)
					render json: "updated"
			    else
					render json:@school_staff.errors.messages, status: :unprocessable_entity
			    end
			
			end

			def destroy
				@school.destroy
			    if @school.destroyed?
					render json: 'destroy successfully'
				end
			end


			private
						
			def school_params
				params.require(:school).permit(:name, :code, :current_strength, :current_staff, :current_issues, :meo_contact_number)
			end

			def set_school
				if School.exists?(params[:id])
					@school = School.find(params[:id])
				else
					return head(:forbidden)
				end
			end
       end
	end
end
































# {"user": {"first_name": "Testemail@ISP.net","last_name": "12", profile_attributes: {}}}


# https://github.com/rails/rails/issues/27360