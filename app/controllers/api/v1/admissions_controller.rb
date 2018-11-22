module Api
	module V1
		class AdmissionsController < ApplicationController
			before_action :set_admission, only: [:show, :destroy, :update]

			def show
				render json: @admission
			end

			def index
			 render json: admissions.all

			end
					 
			def create
	          respond_to do |format|
	              admission = Admission.find(params[:school_id])
	              if admission.save
	                 format.json {render json: 'created successfully'}
	              else
	                 format.json { render json: @admission.errors.messages, status: :unprocessable_entity }
	              end
	          end  
            end

			def update
				respond_to do |format|
					if @admission.update_attributes(admission_params)
						format.json { head :ok }
					else
						format.json { render json: @admission.errors, status: :unprocessable_entity }
					end
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
