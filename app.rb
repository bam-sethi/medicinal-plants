class Plants < Sinatra::Base

  get '/' do

    redirect '/plants'
  end

  get '/plants' do 
    @plants = Plant.all
    erb :index
  end

  # new
  get '/plants/new' do
    @plant = Plant.new
    erb(:"plants/new")
  end

  # create
  post '/plants' do 
    @plant = Plant.new(params[:plant])

    if @plant.save
      redirect("/plants/#{@plant.id}")
    else
      erb(:"plants/new")
    end  
  end

  # show
  get '/plants/:id' do
    @plant = Plant.find(params[:id])
    erb(:"plants/show")
  end

  # edit
  get '/plants/:id/edit' do
    @plant = Plant.find(params[:id])
    erb(:"plants/edit")
  end

  # update
  post '/plants/:id' do 
    @plant = Plant.find(params[:id])
    if @plant.update_attributes(params[:plant])
      redirect("/plants/#{@plant.id}")
    else
      erb(:"plants/edit")
    end
  end

  # delete
  post '/plants/:id/delete' do 
    @plant = Plant.find(params[:id])
    if @plant.destroy
      redirect("/plants")
    else
      redirect("/plants/#{@plant.id}")
    end
  end


end
