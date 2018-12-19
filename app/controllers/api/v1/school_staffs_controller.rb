module Api
	module V1
		class SchoolStaffsController < ApplicationController
			before_action :set_school_staff, only: [:show, :destroy, :update]

			def show
				render json: @school_staff
			end

			def index
		        @school_staffs = SchoolStaff.all
                render json: @school_staffs
            end
					 
			def create
				@school = School.find(params[:school_id])
			    @school_staff = @school.school_staffs.create(school_staff_params)
			    if @school_staff
				   render json: @school_staff
		 	    else
				   render json:@school_staff.errors.messages, status: :unprocessable_entity
				end
		    end

			def update
				if @school_staff.update_attributes(school_staff_params)
					render json: "updated"
				else
					render json:@school_staff.errors.messages, status: :unprocessable_entity
				end
			end

			def destroy
				@school_staff.destroy
				if @school_staff.destroyed?
				   render json: 'destroy successfully'
				end
			end


			private
						
			def school_staff_params
				params.require(:school_staff).permit(:name, :email, :conctact, :year_of_experience, :specialist)
			end

			def set_school_staff
				if SchoolStaff.exists?(params[:id])
					@school_staff = SchoolStaff.find(params[:id])
				else
					return head(:forbidden)
				end
			end



		end
	end
end






# module Api
#   module V1
#     class SchoolInformationsController < ApplicationController

      


#       before_action :set_school_information, only: [:show, :destroy, :update]

#       def show
#            # @school_information = SchoolInformation.find(params[:id])
#            render json: @school_information
#       end
     



#       def index
#         # school = School.find(params[:school_id])
#         render json: school.school_information.all
#       end
    
#       def create
#           respond_to do |format|
#               school = School.find(params[:school_id])
#               school_information = school.build_school_information(school_information_params)
#               if school_information.save
#                  format.json {render json: 'created successfully'}
#               else
#                  format.json { render json: @school_information.errors.messages, status: :unprocessable_entity }
#               end
#           end  
#       end

#       def update
#           respond_to do |format|
#               if @school.update_attributes(school_information_params)
#                  format.json { head :ok }
#               else
#                  format.json { render json: @school_information.errors, status: :unprocessable_entity }
#               end
#           end
#       end
#       def destroy
#           respond_to do |format|
#               school_information = SchoolInformation.find(params[:id])
#               school_information.destroy
#               if school_information.destroyed?
#                   format.json { head :ok }
#               else
#                   format.json { render json: @school_information.errors, status: :unprocessable_entity }
#               end
#           end
#       end

#         private
          
#       def school_information_params
#           params.require(:school_information).permit(:school_id, :strength, :boys, :girls, :school_state, :location, :established_year, :batchs_passedout)
#       end

#       def set_school_information
#           if SchoolInformation.exists?(params[:id])
#               @school_information = SchoolInformation.find(params[:id])
#           else
#               return head(:forbidden)
#           end
#       end



#     end
#  end
# end

