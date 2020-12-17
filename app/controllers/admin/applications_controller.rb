class Admin::ApplicationsController < ApplicationController

    def index
        @applications = Application.all
    end

    def show
        @application = Application.find(params[:id])
        app_status
    end

    def app_status
        # require 'pry'; binding.pry
        if @application.all_approved == true
            require 'pry'; binding.pry
            @application.pets.update_all({adoptable: false})
            @application.update!({status: "Accepted"})
        elsif @application.not_all_approved == true
            @application.update!({status: "Rejected"})
        end
    end


end