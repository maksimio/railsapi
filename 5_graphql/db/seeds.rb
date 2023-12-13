# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Company.delete_all
Company.reset_pk_sequence
Company.create([
    {name:'ОЗОН', location: 'Мурманск'},
    {name: 'СБЕР', location: 'Южно-Сахалинск'},
    {name:'Циан', location: 'Санкт-Петербург'},
    {name:'Яндекс', location: 'Москва'},
])

Job.delete_all
Job.reset_pk_sequence
Job.create([
    {name:'Sinatra React', place:'офис', company_id:1},
    {name:'Ruby React', place:'офис', company_id:2},
    {name:'React', place:'удаленно', company_id:3},
    {name:'Node React', place:'удаленно', company_id:1},
    {name:'Ruby on Rails', place:'офис', company_id:4},
    {name:'Node', place:'удаленно', company_id:4},
    {name:'Javascript CSS HTML', place:'офис', company_id:4},
])

Apply.delete_all
Apply.reset_pk_sequence
Apply.create([
    { job_id: 1, geek_id: 1, read: true, invited: true },
    { job_id: 1, geek_id: 2, read: false, invited: false },
    { job_id: 5, geek_id: 5, read: true, invited: false },
    { job_id: 6, geek_id: 8, read: false, invited: false },
])

Geek.delete_all
Geek.reset_pk_sequence
Geek.create([
    { name: "Стас", stack: "Sinatra React", resume: false },
    { name: "Олег", stack: "Ruby React", resume: true },
    { name: "Егор", stack: "Rails", resume: false },
    { name: "Жанна", stack: "Java", resume: false },
    { name: "Владимир", stack: "Typescript + React", resume: true },
    { name: "Дмитрий", stack: "NodeJS", resume: true },
    { name: "Борис", stack: "Front end", resume: true },
    { name: "Полина", stack: "Typescript + React", resume: false },
    { name: "Кристина", stack: "Full stack", resume: false },
])

Resort.create([
    {name: 'Отель в Сочи', email: 'sochi@mail.ru'},
    {name: 'Отель в Москве', email: 'moscow@mail.ru'}
])

Apartment.create([
    {room_type: 'A', description: 'Лучшие апартаменты', resort_id: 1},
    {room_type: 'B', description: 'Нет отопления', resort_id: 1},
    {room_type: 'C', description: 'Есть телевизор', resort_id: 1},
    {room_type: 'A', description: 'Есть письменный стол', resort_id: 2},
    {room_type: 'A', description: 'Кондиционер', resort_id: 2},
    {room_type: 'B', description: 'Совмещенный санузел', resort_id: 2}
])