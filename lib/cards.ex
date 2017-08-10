defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamon"]

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, reason} -> "That file does not exist #{reason}"
    end
  end
end
