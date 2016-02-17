class ForceUsersController < ApplicationController

  def index

    @force_users = ForceUser.all

  end

  def new

  end

  def create

    @force_user = Unirest.post(
      "http://localhost:3000/force_users.json", 
      headers:{ "Accept" => "application/json"}, 
      parameters: {
        title: params[:title], 
        name: params[:name], 
        affiliation: params[:affiliation], 
        location: params[:location], 
        lightsaber_color: params[:lightsaber_color], 
        dark_or_light: params[:dark_or_light]
      }
      ).body

    render :show

    # if response.code == 200
    #   @force_user = response.body
    #   render :show
    # else
    #   @force_user = {}
    #   render :new
    # end
    
  end

  def show

    @force_user = ForceUser.find(params[:id])

  end

  def edit

    @force_user = Unirest.get("http://localhost:3000/force_users/#{params[:id]}").body

  end

  def update

    @force_user = Unirest.patch(
      parameters: {
        title: params[:title], 
        name: params[:name], 
        affiliation: params[:affiliation], 
        location: params[:location], 
        lightsaber_color: params[:lightsaber_color], 
        dark_or_light: params[:dark_or_light]
      }
      ).body

    render :show

  end

  def destroy

    @employee = Employee.find(params[:id])
    message = @employee.destroy
 

    flash[:message] = message["message"]
    redirect_to "/force_users"

  end

end
