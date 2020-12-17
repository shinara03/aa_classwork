require 'sqlite3'
require 'singleton'
require "byebug"

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User 
  attr_reader :id
  attr_accessor :lname, :fname

  def self.find_by_id(id)
    person = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT 
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    # debugger
    return nil unless person.length > 0

    User.new(person.first)
  end

  def self.find_by_name(fname, lname)
    name = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        users.fname =  ? AND users.lname = ?
    SQL
    return nil unless name.length > 0 
    debugger
    # User.new(name.first) # user.new vs mapping | use the example version
    names.map { |user| User.new(user) }
  end

  def initialize(options = {})
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

  def create
    raise "#{self} already in database" if @id
    QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
    SQL
    @id = QuestionsDatabase.instance.last_insert_row_id
  end

end

lena = {'id' => 1, 'fname' => 'Lena', 'lname' => 'Shin'}
john = {'id' => 2, 'fname' => 'John', 'lname' => 'John'}
c = User.new(lena)
d = User.new(john)
# p User.find_by_id(1)
p User.find_by_name('John','John')

# --------------------------------------- #
# --------------------------------------- #

# class Questions 
#   attr_reader :id
#   attr_accessor :lname, :fname
#   def self.find_by_id(id)
#     question = QuestionsDatabase.instance.execute(<<-SQL, id)
#       SELECT 
#         *
#       FROM
#         questions
#       WHERE
#         id = ?
#     SQL
#     return nil unless person.length > 0

#     Questions.new(the_hash)
#   end

#   result = [
#     {question_id = 00,
#     title = "Question's title",
#     body = "What do we do?"
#     author_id = users(id)}
#   ]

#   def self.find_by_question(question)
#     inquiry = QuestionsDatabase.instance.execute(<<-SQL, id)
#       SELECT
#         *
#       FROM
#         questions
#       WHERE
#         questions.user_id = user_id AND questions.question_id = question_id
#     SQL
#     return nil unless inquiry.length > 0 

#     # User.new(name.first) # user.new vs mapping | use the example version
#     inquiries.map { |user| User.new(user) }
#   end

#   def initialize(options = {})
#     @id = options['id']
#     @title = options['title']
#     @body = options['body']
#     @author_id = options['author_id']
#   end
# end


# https://assets.aaonline.io/fullstack/sql/homeworks/plays/plays.rb

#https://open.appacademy.io/learn/swe-in-person/sql/plays-playwrights-orm