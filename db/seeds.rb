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

user1 = User.create(
  first_name: "admin",
  last_name: "admin",
  position: "administrator",
  phone: "0",
  gender: "male",
  email: "admin@gmail.com",
  password: "secret",
)

project1 = Project.create(
  name: "Develop Front End",
  created_by: user1,
  progress: 10,
  status: "in_progress",
)

assign1 = ProjectAssign.create(
  user: user1,
  project: project1,
)

my_kanban = Kanban.create(
  name: "New Lamborgucci project",
  description: "Project to build the most esthetically car ever made.",
  project: project1,
)

backlog = KanbanColumn.create(
  name: "not_started",
  kanban: my_kanban,
)
Task.create(name: "Build engine", position: 0, kanban_column: backlog)

todo = KanbanColumn.create(
  name: "in_progress",
  kanban: my_kanban,
)
Task.create(name: "Design the car", position: 0, kanban_column: todo)

completed = KanbanColumn.create(
  name: "completed",
  kanban: my_kanban,
)
Task.create(name: "Build the engineer team", position: 0, kanban_column: completed)
