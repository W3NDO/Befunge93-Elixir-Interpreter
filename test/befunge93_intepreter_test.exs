defmodule Befunge93IntepreterTest do
  use ExUnit.Case
  doctest Befunge93Intepreter

  test "greets the world" do
    assert Befunge93Intepreter.hello() == :world
  end

  test 'Hello world in Befunge93' do
    assert Befunge93Intepreter.intepret('>              v\nv  ,,,,,"Hello"<\n>48*,          v\nv,,,,,,"World!"<\n>25*,@') = "Hello World!"
  end

  test 'count to 9' do
    assert Befunge93Intepreter.intepret('>987v>.v\nv456<  :\n>321 ^ _@') = "123456789"
  end
end
