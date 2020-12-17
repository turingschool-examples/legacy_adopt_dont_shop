class Admin::ApplicationsController < ApplicationController

    def index
        @applications = Application.all
    end

    def show
        @application = Application.find(params[:id])
        app_status
    end

    def app_status
        require 'pry'; binding.pry
        if @application.all_approved == true
            @pets.all.update({adoptable: false})
            @application.update!({status: 3})
        elsif @application.not_all_approved == true
            @application.update!({status: 4})
        end
    end


end