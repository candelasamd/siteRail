class PagesController < ApplicationController

    before_action :set_page, only: [:show, :edit, :update, :destroy]

    def index
        @pages=Page.all
    end

    def show
        #render html: params[:id]
    end

    def new
        @page=Page.new
    end
    def create
        @page=Page.new(page_params())
        @page.save
        #render plain: params.to_json
        redirect_to @page
    end

    def edit
    end

    def update
        @page.update(page_params())
        redirect_to @page
    end

    def destroy
        @page.destroy
        redirect_to pages_path
        #redirect_to pages_url
    end

    private 
    def set_page
        @page=Page.find(params[:id])
    end
    def page_params
        params.require(:page).permit(:title,:body,:slug)
    end
end


