module Api
	module V1
		class AdmissionsController < ApplicationController
			before_action :set_admission, only: [:show, :destroy, :update]

			def show
				render json: @admission
			end

			def index
		        @admissions = Admission.all
		        render json: @admissions
			end
					 
			def create
				@school = School.find(params[:school_id])
			    @admission = @school.admissions.create(admission_params)
			    
			    if @admission
				   render json: @admission
		 	    else
				   render json: @admission.errors, status: :unprocessable_entity
				end
		    end
			
			def update
			    if @admission.update_attributes(admission_params)
					render json: "updated"
				else
					render json:@admission.errors.messages, status: :unprocessable_entity
                end
			end

			def destroy
				@admission.destroy
				if @admission.destroyed?
					render json: 'destroy successfully'
				end
			end


			private
						
			def admission_params
				params.require(:admission).permit(:year, :boys, :girls)
			end

			def set_admission
				if Admission.exists?(params[:id])
					@admission = Admission.find(params[:id])
				else
					return head(:forbidden)
				end
			end


		end
	end
end












# https://blog.bigbinary.com/2016/04/19/changes-to-test-controllers-in-rails-5.html