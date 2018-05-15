defmodule ExIMDbSnifferTest do
  use ExUnit.Case
  doctest ExIMDbSniffer

  test "get Jim Carrey" do
    jim_carrey = ExIMDbSniffer.people("nm0000120")
    assert jim_carrey.name == "Jim Carrey"
    assert jim_carrey.birth_date == "1962-1-17"
  end

end
