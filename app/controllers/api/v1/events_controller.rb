module Api
	module V1
		class EventsController < ApplicationController
			before_action :set_event, only: [:show, :destroy, :update]

			def show
				render json: @event
			end

			def index
		        @events = Event.all
		        render json: @events
            end

			def create
				@school = School.find(params[:school_id])
			    @event = @school.events.create(event_params)
			    
			    if @event
				   render json: @event
		 	    else
				   render json: @event.errors.messages, status: :unprocessable_entity
				end
			end

			def update
				if @event.update_attributes(event_params)
					render json: "updated"
				else
				   render json:@school_staff.errors.messages, status: :unprocessable_entity
				end
			end

			def destroy
				@event.destroy
				if @event.destroyed?
					render json: 'destroy successfully'
				end
			end


			private
						
			def event_params
				params.require(:event).permit(:name, :date_of_event, :plans)
			end

			def set_event
				if Event.exists?(params[:id])
					@event = Event.find(params[:id])
				else
					return head(:forbidden)
				end
			end



		end
	end
end








   #          def update
			# 	respond_to do |format|
			# 		if @event.update_attributes(event_params)
			# 			format.json { head :ok }
			# 		else
			# 			format.json { render json: @event.errors, status: :unprocessable_entity }
			# 		end
			# 	end
			# end