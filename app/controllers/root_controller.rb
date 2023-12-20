class RootController < ApplicationController
    def about
       
    end
    def contact 

    end
    
    def index 
        @todos = Todo.all
        render "index"
    end
    def api 
        @response = {
            :status => 200 ,
            :msg => "Hello World"
        }
        render json: @response
    end

    def user 
        render json: params
    end

    def add
        @todo = Todo.new
        @todo.title = params[:title]
        @todo.description = params[:description]
        @todo.save
        @response = {
            :status => 200 ,
            :msg => "save successfully"
        }
        @todos = Todo.all
        redirect_to "/index"
    end


    def delete
      @todo = Todo.find(params[:id])
      @todo.destroy
      redirect_to "/index"
    end

    def search 
        @query = params[:query]
        @todos = Todo.where("posts.title LIKE ?",["%#{@query}%"])
        render "index"
    end
end
