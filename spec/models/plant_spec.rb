require 'rails_helper'

RSpec.describe Plant, type: :model do
  it 'is valid with valid attributes' do
    plant = Plant.create(name:'Sequoia' ,age:10, enjoy:'long walks in the forest', image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9OK9Ruz93vt11rknIyVLgttYtxSSunirYQ&usqp=CAU')
    expect(plant).to be_valid
  end

  it 'should validate name' do
    plant = Plant.create(age:10, enjoy:'long walks in the forest', image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9OK9Ruz93vt11rknIyVLgttYtxSSunirYQ&usqp=CAU')
    expect(plant.errors[:name]).to_not be_empty
    expect(plant.errors[:name]).to include "can't be blank"
  end

  it 'should have an age' do
    plant = Plant.create(name:'Sequoia', enjoy:'long walks in the forest', image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9OK9Ruz93vt11rknIyVLgttYtxSSunirYQ&usqp=CAU')
    expect(plant.errors[:age]).to_not be_empty
    expect(plant.errors[:age].length).to eq 1
  end

  it 'should enjoy something' do
    plant = Plant.create(name:'Sequoia', age:10, image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9OK9Ruz93vt11rknIyVLgttYtxSSunirYQ&usqp=CAU')
    expect(plant.errors[:enjoy]).to_not be_empty
  end

  it 'should enjoy something' do
    plant = Plant.create(name:'Sequoia', age:10, enjoy: 'walking', image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9OK9Ruz93vt11rknIyVLgttYtxSSunirYQ&usqp=CAU')
    expect(plant.errors[:enjoy]).to_not be_empty
  end

  it 'should have an image' do
    plant = Plant.create(name:'Sequoia', age:10, enjoy:'long walks in the forest')
    expect(plant.errors[:image]).to_not be_empty
  end
end






