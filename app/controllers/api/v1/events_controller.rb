module Api
	module V1
		class EventsController < ApplicationController
			before_action :set_event, only: [:show, :destroy, :update]

			def show
				render json: @event
			end

			def index
			 render json: school.events.all

			end
					 
			def create
	          respond_to do |format|
	              event = Event.find(params[:school_id])
	              if event.save
	                 format.json {render json: 'created successfully'}
	              else
	                 format.json { render json: @event.errors.messages, status: :unprocessable_entity }
	              end
	          end  
            end

			def update
				respond_to do |format|
					if @event.update_attributes(event_params)
						format.json { head :ok }
					else
						format.json { render json: @event.errors, status: :unprocessable_entity }
					end
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
