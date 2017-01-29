require_relative 'todo_list'

class CommandLineInterface
  def initialize
    @todos = TodoList.load('todos.td')
  end

  def help(_)
    puts "usage: ruby todo.rb command [options]\n\ncommands: add, done, list"
  end

  def add(todo)
    @todos.add todo
  end

  def done(todo)
    @todos.done todo
  end

  def list(_)
    @todos.each_with_index do |todo, index|
      puts "#{index + 1}. #{todo}"
    end
  end

  def save
    @todos.save('todos.td')
  end
end
