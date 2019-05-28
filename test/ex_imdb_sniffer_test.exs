defmodule ExIMDbSnifferTest do
  use ExUnit.Case
  doctest ExIMDbSniffer

  test "get Jim Carrey" do
    jim_carrey = ExIMDbSniffer.people("nm0000120")

    assert jim_carrey == %ExIMDbSniffer.People{
             birth_date: "1962-01-17",
             birth_location: "Newmarket, Ontario, Canada",
             name: "Jim Carrey",
             picture_url:
               "https://m.media-amazon.com/images/M/MV5BMTQwMjAwNzI0M15BMl5BanBnXkFtZTcwOTY1MTMyOQ@@._V1_.jpg",
             job_titles: ["Actor", "Writer", "Producer"]
           }
  end
end
