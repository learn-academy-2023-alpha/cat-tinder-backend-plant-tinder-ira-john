require 'rails_helper'

RSpec.describe 'Plants', type: :request do
  describe 'GET /index' do
    it 'gets a list of plants' do
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


  describe 'POST /create' do
    it 'creates a plant' do
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
    
    it "doesn't create a plant without a name" do 
      plant_params = {
        plant: {
        age: 10,
        enjoy: 'long walks in the forest',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9OK9Ruz93vt11rknIyVLgttYtxSSunirYQ&usqp=CAU'
        }
      }
      post '/plants', params: plant_params 
      expect(response.status).to eq 422
      plant = JSON.parse(response.body)
      expect(plant['name']).to include "can't be blank"
    end

    it "doesn't create a plant without an age" do
      plant_params ={
      plant: {
      name:'Sequoia',
      enjoy:'long walks in the forest',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9OK9Ruz93vt11rknIyVLgttYtxSSunirYQ&usqp=CAU'
      }
      }
      post '/plants', params: plant_params
      expect(response.status).to eq 422
      plant = JSON.parse(response.body)
      expect(plant['age']).to include "can't be blank"
    end
      
    it "doesn't create a plant without an enjoy" do
      plant_params ={
      plant: {
      name:'Sequoia',
      age:10,
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9OK9Ruz93vt11rknIyVLgttYtxSSunirYQ&usqp=CAU'
      }
      }
      post '/plants', params: plant_params
      expect(response.status).to eq 422
      plant = JSON.parse(response.body)
      expect(plant['enjoy']).to include "can't be blank"
    end
  
    it "doesn't create a plant without an image" do
      plant_params ={
      plant: {
      name:'Sequoia',
      age:10,
      enjoy: 'long walks in the forest'
      }
      }
      post '/plants', params: plant_params
      expect(response.status).to eq 422
      plant = JSON.parse(response.body)
      expect(plant['image']).to include "can't be blank"
    end
  end

  describe 'PATCH /update' do
    it 'updates a plant' do
    plant_params ={
    plant:{
      name: 'Harold',
      age:12,
      enjoy: 'insect and people watching',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEr2hrRtXjiqoWSyrog7ibYSYlOUoESSJtw&usqp=CAU'}
    }
  
    post '/plants', params: plant_params
    plant = Plant.first
    
    updated_plant_params = {
     plant: { name: 'Harold',
      age:13,
      enjoy: 'insect and people watching',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEr2hrRtXjiqoWSyrog7ibYSYlOUoESSJtw&usqp=CAU'}
  }
    patch "/plants/#{plant.id}", params:updated_plant_params
      updated_plant = Plant.find(plant.id)
      expect(response).to have_http_status(200)
      expect(updated_plant.age).to eq 13
    end
    it "doesn't update a plant without a name" do 
      plant_params = {
        plant: {
        name:'',
        age: 10,
        enjoy: 'long walks in the forest',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9OK9Ruz93vt11rknIyVLgttYtxSSunirYQ&usqp=CAU'
        }
      }
      post '/plants', params: plant_params 
      expect(response.status).to eq 422
      plant = JSON.parse(response.body)
      expect(plant['name']).to include "can't be blank"
    end

    it "doesn't update a plant without an age" do
      plant_params ={
      plant: {
      name:'Sequoia',
      age: '',
      enjoy:'long walks in the forest',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9OK9Ruz93vt11rknIyVLgttYtxSSunirYQ&usqp=CAU'
      }
      }
      post '/plants', params: plant_params
      expect(response.status).to eq 422
      plant = JSON.parse(response.body)
      expect(plant['age']).to include "can't be blank"
    end
      
    it "doesn't update a plant without an enjoy" do
      plant_params ={
      plant: {
      name:'Sequoia',
      age:10,
      enjoy: '',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9OK9Ruz93vt11rknIyVLgttYtxSSunirYQ&usqp=CAU'
      }
      }
      post '/plants', params: plant_params
      expect(response.status).to eq 422
      plant = JSON.parse(response.body)
      expect(plant['enjoy']).to include "can't be blank"
    end
  
    it "doesn't update a plant without an image" do
      plant_params ={
      plant: {
      name:'Sequoia',
      age:10,
      enjoy: 'long walks in the forest',
      image: ''
      }
      }
      post '/plants', params: plant_params
      expect(response.status).to eq 422
      plant = JSON.parse(response.body)
      expect(plant['image']).to include "can't be blank"
    end
  end
  
  describe 'DELETE /destroy' do
    it 'deletes a plant' do
    plant_params ={
    plant:{
      name: 'Harold',
      age:12,
      enjoy: 'insect and people watching',
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
end
