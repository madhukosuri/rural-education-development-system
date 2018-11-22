module Api
	module V1
		class SchoolsController < ApplicationController
			before_action :set_school, only: [:show, :destroy, :update]

			def show
				render json: @school
			end

			def index
			 respond_to do |format|
					schools = School.all
					format.json {render json: schools}
			 end
			end
					 
			def create
				respond_to do |format|
					@school = School.new(school_params)
					if @school.save
						format.json {render json: 'created successfully'}
					else
						format.json { render json: @school.errors.messages, status: :unprocessable_entity }
					end 
				end 
			end

			def update
				respond_to do |format|
					if @school.update_attributes(school_params)
						format.json { head :ok }
					else
						format.json { render json: @school.errors, status: :unprocessable_entity }
					end
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