require 'test/unit'
require 'rubygems'
require 'fastercsv'
require 'active_support'
require File.dirname(__FILE__) + '/../lib/to_csv'
require File.dirname(__FILE__) + '/user_model'

class ToCsvTest < Test::Unit::TestCase

  def setup
    @users = []
    @users << User.new(:id => 1, :name => 'Ary', :age => 24)
    @users << User.new(:id => 2, :name => 'Nati', :age => 21)
  end

  def test_with_no_options
    assert_equal( "Name,Age\nAry,24\nNati,21\n", @users.to_csv )
  end
  
  def test_with_id
    assert_equal( "Id,Name,Age\n1,Ary,24\n2,Nati,21\n", @users.to_csv(:id => true) )
  end
  
  def test_with_only
    assert_equal( "Name\nAry\nNati\n", @users.to_csv(:only => :name) )
  end
  
  def test_with_except
    assert_equal( "Age\n24\n21\n", @users.to_csv(:except => :name) )
  end
  
end
