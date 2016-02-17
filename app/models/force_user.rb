class ForceUser

  attr_reader :id
  attr_accessor :title, :name, :affiliation, :location, :lightsaber_color, :dark_or_light

  def initialize(hash)

    @id = hash["id"]
    @title = hash["title"]
    @name = hash["name"]
    @affiliation = hash["affiliation"]
    @location = hash["location"]
    @lightsaber_color = hash["lightsaber_color"]
    @dark_or_light = hash["dark_or_light"]

  end

  def full_name

    "#{title} #{name}"

  end

  def self.all
    
    api_force_users_array = Unirest.get("http://localhost:3000/force_users").body
    force_users = []
    
    api_force_users_array.each do |api_force_user|
      force_users << ForceUser.new(api_force_user)
    end
    force_users 

  end

  def self.find(id)

    ForceUser.new(Unirest.get("http://localhost:3000/force_users/#{id}").body)

  end

  def destroy

    Unirest.delete(
          "http://localhost:3000/force_users/#{id}", 
          headers:{ "Accept" => "application/json"}
          ).body

  end

end