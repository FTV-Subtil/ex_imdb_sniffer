defmodule ExIMDbSnifferTest do
  use ExUnit.Case
  doctest ExIMDbSniffer

  test "get Jim Carrey" do
    jim_carrey = ExIMDbSniffer.people("nm0000120")

    assert jim_carrey == %ExIMDbSniffer.People{
             birth_date: "1962-1-17",
             birth_location: "Newmarket, Ontario, Canada",
             name: "Jim Carrey",
             picture_url:
               "https://ia.media-imdb.com/images/M/MV5BMTQwMjAwNzI0M15BMl5BanBnXkFtZTcwOTY1MTMyOQ@@._V1_UY317_CR22,0,214,317_AL_.jpg"
           }
  end
end
