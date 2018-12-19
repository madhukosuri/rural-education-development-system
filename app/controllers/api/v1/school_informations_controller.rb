
module Api
  module V1
    class SchoolInformationsController < ApplicationController

      # def to_json 
      #   {:id => @id, :name => @name, :code => @code}.to_json
      # end


      before_action :set_school_information, only: [:show, :destroy, :update]

      def show
           # @school_information = SchoolInformation.find(params[:id])
           render json: @school_information
      end
     



      def index
        # school = School.find(params[:school_id])
        render json: school.school_information.all
      end
    
      def create
          respond_to do |format|
              school = School.find(params[:school_id])
              school_information = school.build_school_information(school_information_params)
              if school_information.save!
                 format.json {render json: 'created successfully'}
              else
                 format.json { render json: @school_information.errors.messages, status: :unprocessable_entity }
              end
          end  
      end

      def update
          respond_to do |format|
              if @school.update_attributes(school_information_params)
                 format.json { head :ok }
              else
                 format.json { render json: @school_information.errors, status: :unprocessable_entity }
              end
          end
      end
      def destroy
          respond_to do |format|
              school_information = SchoolInformation.find(params[:id])
              school_information.destroy
              if school_information.destroyed?
                  format.json { head :ok }
              else
                  format.json { render json: @school_information.errors, status: :unprocessable_entity }
              end
          end
      end

        private
          
      def school_information_params
          params.require(:school_information).permit(:school_id, :strength, :boys, :girls, :school_state, :location, :established_year, :batchs_passedout)
      end

      def set_school_information
          if SchoolInformation.exists?(params[:id])
              @school_information = SchoolInformation.find(params[:id])
          else
              return head(:forbidden)
          end
      end





# module Api
#   module V1
#     class SchoolsController < ApplicationController
#       before_action :set_school, only: [:show, :destroy, :update]

#       def show
#         render json: @school
#       end

#       def index
#        respond_to do |format|
#           schools = School.all
#           format.json {render json: schools}
#        end
#       end
           
#       def create
#         respond_to do |format|
#           @school = School.new(school_params)
#           if @school.save
#             format.json {render json: 'created successfully'}
#                      # render json: 'created successfully'
#           else
#             format.json { render json: @school.errors.messages, status: :unprocessable_entity }
#                      # render json: @school.errors.messages, status: :unprocessable_entity
#           end 
#         end 
#       end

#       def update
#         respond_to do |format|
#           if @school.update_attributes(school_params)
#             format.json { head :ok }
#           else
#             format.json { render json: @school.errors, status: :unprocessable_entity }
#           end
#         end
#       end

#       def destroy
#               # respond_to do |format|
#         @school.destroy
#           if @school.destroyed?
#                       # format.json { head :ok }
#             render json: 'destroy successfully'
#                   # else
#                       # format.json { render json: @school.errors, status: :unprocessable_entity 
#           end
#               # end
#       end


#       private
            
#       def school_params
#         params.require(:school).permit(:name, :code)
#       end

#       def set_school
#         if School.exists?(params[:id])
#           @school = School.find(params[:id])
#         else
#           return head(:forbidden)
#         end
#       end



#     end
#   end
# end

