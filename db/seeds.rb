# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

KanbanColumn.destroy_all
Kanban.destroy_all
Task.destroy_all
User.destroy_all
Wiki.destroy_all
Note.destroy_all
Notification.destroy_all
Message.destroy_all
Chatroom.destroy_all

# KanbanColumn.last(6).each(&:destroy)
# Kanban.last(2).each(&:destroy)
# Task.last(2).each(&:destroy)

# chat.destroy
# chat1.destroy
# chat2.destroy
# note1.destroy
# note2.destroy
# note3.destroy
# task1.destroy
# task2.destroy
# task3.destroy
# task4.destroy
# task5.destroy
# task6.destroy
# backlog.destroy
# todo.destroy
# todo2.destroy
# completed.destroy
# completed2.destroy
# todo2.destroy
# backlog2.destroy
# my_kanban2.destroy
# my_kanban.destroy
# assign1.destroy
# assign2.destroy
# assign3.destroy
# assign4.destroy
# assign5.destroy
# assign6.destroy
# assign7.destroy
# assign8.destroy
# assign9.destroy
# assign10.destroy
# assign11.destroy
# user1.destroy
# user2.destroy
# user3.destroy
# project1.destroy
# project2.destroy

user1 = User.create(
  first_name: "Nick",
  last_name: "Ang",
  position: "Project_manager",
  phone: "0430102545",
  gender: "Male",
  email: "nick@pnp.com",
  password: "secret",
  admin: true,
  salary: 100000,
  pay_cycle: "Weekly",
  birthdate: Date.new(1993, 7, 27),
  tfn: 333888999,
  bank_account: 17339022,
  bank_bsb: 860078,
  last_pay: DateTime.now() - 6,
)

user2 = User.create(
  first_name: "Fisher",
  last_name: "Lim",
  position: "Employee",
  phone: "0410142546",
  gender: "Male",
  email: "fisher@pnp.com",
  password: "secret",
  admin: false,
  salary: 80000,
  pay_cycle: "Fortnightly",
  birthdate: DateTime.new(1993, 7, 27, 4),
  tfn: 444888999,
  bank_account: 18439022,
  bank_bsb: 120078,
  last_pay: DateTime.now() - 15,
)

user3 = User.create(
  first_name: "Setare",
  last_name: "Akbare",
  position: "Administrator",
  phone: "0455162546",
  gender: "Male",
  email: "setare@pnp.com",
  password: "secret",
  admin: false,
  salary: 120000,
  pay_cycle: "Monthly",
  birthdate: DateTime.new(1993, 7, 27, 4),
  tfn: 111888999,
  bank_account: 30439022,
  bank_bsb: 2220078,
  last_pay: DateTime.now,
)

project1 = Project.create(
  name: "Develop PNP App",
  created_by: user1,
  progress: 90,
  start_date: DateTime.now() - 30,
  end_date: DateTime.now() + 10,
  status: "in_progress",
)

project2 = Project.create(
  name: "Develop Google App",
  created_by: user1,
  progress: 100,
  status: "completed",
  start_date: DateTime.now() - 100,
  end_date: DateTime.now() - 50,
)

assign1 = ProjectAssign.create(
  user: user1,
  project: project1,
)

assign2 = ProjectAssign.create(
  user: user2,
  project: project1,
)

assign3 = ProjectAssign.create(
  user: user3,
  project: project1,
)

assign4 = ProjectAssign.create(
  user: user1,
  project: project2,
)

my_kanban = Kanban.create(
  project: project1,
)

backlog = KanbanColumn.create(
  name: "not_started",
  kanban: my_kanban,
)

todo = KanbanColumn.create(
  name: "in_progress",
  kanban: my_kanban,
)

completed = KanbanColumn.create(
  name: "completed",
  kanban: my_kanban,
)

my_kanban2 = Kanban.create(
  project: project2,
)

backlog2 = KanbanColumn.create(
  name: "not_started",
  kanban: my_kanban2,
)

todo2 = KanbanColumn.create(
  name: "in_progress",
  kanban: my_kanban2,
)

completed2 = KanbanColumn.create(
  name: "completed",
  kanban: my_kanban2,
)

task1 = Task.create(duration: 1, name: "Push to Heroku", position: 0, status: "not_started", kanban_column: backlog, priority: "low", due_date: DateTime.now() + 1)
assign5 = TaskAssign.create(user: user1, task: task1)
task2 = Task.create(duration: 10, name: "Bug testing", position: 0, status: "in_progress", kanban_column: todo, priority: "medium", due_date: DateTime.now() + 3)
assign6 = TaskAssign.create(user: user2, task: task2)
task3 = Task.create(duration: 1000, name: "Develop program", position: 0, status: "completed", kanban_column: completed, priority: "high", due_date: DateTime.now() - 10)
assign7 = TaskAssign.create(user: user2, task: task3)
assign8 = TaskAssign.create(user: user1, task: task3)
task4 = Task.create(duration: 15, name: "Finalize Documentation", position: 1, status: "not_started", kanban_column: backlog, priority: "medium", due_date: DateTime.now() - 3)
assign9 = TaskAssign.create(user: user2, task: task4)
task5 = Task.create(duration: 5000, name: "Review and Deploy", position: 1, status: "completed", kanban_column: completed2, priority: "high", due_date: DateTime.new(2021, 8, 18))
assign10 = TaskAssign.create(user: user1, task: task5)
task6 = Task.create(duration: 10, name: "Tally hours worked", position: 1, status: "completed", kanban_column: completed2, priority: "high", due_date: DateTime.new(2021, 8, 18))
assign11 = TaskAssign.create(user: user3, task: task6)
note1 = Note.create(title: "Check if HR paid", description: "Message Setare", user: user2, color: "red")
note2 = Note.create(title: "Buy Milk Tonight", description: "2 L Brownes", user: user2, color: "green")
note3 = Note.create(title: "Mums birthday in two weeks", description: "", user: user2, color: "yellow")
chat = Chatroom.create(name: "HR and Local Admin Chatroom")
chat1 = ChatroomAssign.create(user: user1, chatroom: chat)
chat2 = ChatroomAssign.create(user: user3, chatroom: chat)
