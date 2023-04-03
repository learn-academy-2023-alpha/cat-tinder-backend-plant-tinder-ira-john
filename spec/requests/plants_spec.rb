require 'rails_helper'

RSpec.describe "Plants", type: :request do
  describe "GET /index" do
    it "gets a list of plants" do
      Plant.create(
        name: 'Harold',
        age: 12,
        enjoy: 'insect and people watching',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEr2hrRtXjiqoWSyrog7ibYSYlOUoESSJtw&usqp=CAU'
      )
      get '/plants'
      plant = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(plant.length).to eq 1
    end
  end
end

  describe "POST /create" do
    it "creates a plant" do
    plant_params = {
      plant:{
        name: 'James',
        age: 4,
        enjoy: 'insect and people watching',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmJQqXGKaJ5Foa3K907spFrebMrcqG4GZeLg-7By53RrYOTofNtOU77A8BBRhh-pz92ng&usqp=CAU'}
   }
   post '/plants', params: plant_params
      expect(response).to have_http_status(200)
      plant = Plant.first
      expect(plant.name).to eq 'James'
    end
  end

  describe "PATCH /update" do
    it "updates a plant" do
    plant_params ={
    plant:{
      name: "Harold",
      age:12,
      enjoys: "insect and people watching",
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEr2hrRtXjiqoWSyrog7ibYSYlOUoESSJtw&usqp=CAU'}
    }
  
    post '/plants', params: plant_params
    plant = Plant.first
    
    updated_plant_params = {
     plant: { name: "Harold",
      age:13,
      enjoys: "insect and people watching",
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEr2hrRtXjiqoWSyrog7ibYSYlOUoESSJtw&usqp=CAU'}
  }
    patch "/plants/#{plant.id}", params:updated_plant_params
      updated_plant = Plant.find(plant.id)
      expect(response).to have_http_status(200)
      expect(updated_plant.age).to eq 13
    end
  end
  
  describe "DELETE /destroy" do
    it 'deletes a plant' do
    plant_params ={
    plant:{
      name: "Harold",
      age:12,
      enjoys: "insect and people watching",
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEr2hrRtXjiqoWSyrog7ibYSYlOUoESSJtw&usqp=CAU'}
    }
    
    post '/plants',  params: plant_params
      plant = Plant.first
      plants = Plant.all
  
    delete"/plants/#{plant.id}"
      expect(response).to have_http_status(200)
      expect(plants).to be_empty
    end
  end
