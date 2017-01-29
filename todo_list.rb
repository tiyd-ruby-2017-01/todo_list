require 'forwardable'
require_relative 'todo_item'

class TodoList
  include Enumerable
  extend Forwardable

  def_delegators :@todos, :each, :<<, :[]

  attr_reader :todos

  def initialize
    @todos = []
  end

  def add(todo)
    self << TodoItem.new(todo.strip)
  end

  def done(id)
    begin
      id = Integer(id)

      todo = self[id - 1]

      return if todo.nil?

      todo.done = true
    rescue ArgumentError
    end
  end

  def save(file)
    text = @todos.reject(&:done).map(&:description).join("\n")

    File.open(file, 'w') { |f| f.write(text) }
  end

  def self.load(file)
    todos = TodoList.new

    File.exists?(file) and File.readlines(file).each do |line|
      todos.add line
    end

    todos
  end
end
