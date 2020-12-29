require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    return @columns if @columns
    cols = DBConnection.execute2(<<-SQL).first
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    cols.map! do |col|
      col.to_sym
    end

    @columns = cols
  end

  def self.finalize!

    self.columns.each do |col| 
      define_method(col) {self.attributes[col]}
      define_method("#{col}=") do |value|
        self.attributes[col] = value
      end
    end
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    # name = ""
    # "#{self}".each_char.with_index do |char, idx|
    #   if char.upcase == char 
    #     if idx == 0 
    #       name += char.downcase
    #     else
    #       name += "_" + char.downcase
    #     end
    #   else 
    #       name += char
    #   end
    # end
    # name += 's'
    # name
    @table_name || self.name.underscore.pluralize
  end

  def self.all
    # ...
    results = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
    SQL

    parse_all(results)
  end

  def self.parse_all(results)
    # ...
    results.map do |result|
      self.new(result)
    end
  end

  def self.find(id)
    # ...

    result = DBConnection.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self.table_name}
      WHERE
        #{self.table_name}.id = ?
    SQL

    parse_all(result).first
  end

  def initialize(params = {})
    # ...
    params.each do |attr_name, value|
      columns = self.class.columns
      sym_name = attr_name.to_sym
      raise "unknown attribute '#{attr_name}'" unless columns.include?(sym_name)
      self.send("#{attr_name}=", value)
    end
  end

  def attributes
    # ...
    @attributes ||= {}

  end

  def attribute_values
    # ...
    attributes = self.class.columns
    attributes.map do |attr|
      self.send(attr)
    end
  end

  def insert
    # ...
    columns = self.class.columns
    col_names = columns.join(",")
    question_marks = (["?"] * columns.length).join(",")
    
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
    SQL
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
