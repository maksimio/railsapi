namespace '/api/v1' do
  get '/companies' do
    where = []
    if params[:name]
      where << Sequel.like(:name, params[:name].to_s + "%")
    end
    if params[:location]
      where << Sequel.like(:location, params[:location].to_s + "%")
    end
    if where.length > 0
      collection_to_api(DB[:companies].where(*where).all)
    else
      collection_to_api(DB[:companies].all)
    end
  end

  get '/company_jobs' do
    Company.company_jobs(params[:name])
  end

  get '/companies/:id' do
    collection_to_api(DB[:companies].where({id: params[:id]}).all)
  end

  get '/companies/:id/jobs' do
    collection_to_api(DB[:jobs].where({company_id: params[:id]}).all)
  end

  post '/companies' do
    # id = DB[:companies].insert(name: params[:name], location: params[:location])
    # collection_to_api(DB[:companies].where(:id => id).all)
    return Company.create(params)
  end

  

  post '/companies/:id' do
    DB[:companies].where(:id => params[:id]).update(name: params[:name], location: params[:location])

    collection_to_api(DB[:companies].where(:id => params[:id]).all)
  end
end