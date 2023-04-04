
plant = [
   {name:'Sequoia',
    age:10,
    enjoy:'long walks in the forest',
    image:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA9OK9Ruz93vt11rknIyVLgttYtxSSunirYQ&usqp=CAU'},

    {name: 'Betty',
     age: 13,
     enjoy: 'days spent in the sun',
     image: 'https://i0.wp.com/laidbackgardener.blog/wp-content/uploads/2018/07/20180725e-myrtillocactus-geometrizans-fukurokuryuzinboku-worldofsucculents-com.jpg?w=1024&ssl=1'},


    {name: 'Felicia',
     age: 5,
     enjoy: 'rainy days and cloudy skies',
     image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuAOetJ_-BormLz-oXLOXEnJkfaZa61bOCMQ&usqp=CAU'},


    {name: 'Harold',
     age: 12,
     enjoy: 'insect and people watching',
     image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUEr2hrRtXjiqoWSyrog7ibYSYlOUoESSJtw&usqp=CAU'},
]

plant.each do
  Plant.create plant
    puts "creating plants #{plant}"
end