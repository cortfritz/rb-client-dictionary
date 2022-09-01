defmodule Client.CLI do
  @moduledoc """
  A cli that uses
  """
  def main([]) do
    raise "you must supply an operation and a word e.g. \"$ client insert foo\" where \"client\" is the cli, \"insert\" is the operation and \"foo\" is the word."
  end
  def main([_ | [ _ | overflow ]])
    when overflow != [] do
    raise "too many arguments: client accepts an operation and a single word."
  end

  # TODO: protect against words longer than 189,819 characters
  # TODO: protect against special characters e.g. with...
      # s
      # |> String.to_charlist()
      # |> Enum.filter(&(&1 in 0..127))
      # |> List.to_string

  def main([operation | args ]) do
    process(operation, args )
  end


  def process(_, []) do
    raise "You must supply a word, try \"foo\".  Quotes are optional."
  end

  def process(operation, args) do
    [ word | _ ] = args
    open_file()
    |> tx(operation, word)
    |> send_result
    |> close_file
  end



  def tx(file, "insert", word) do
    result = case :dets.insert(file, {word, :valid}) do
      :ok -> 0
      _ -> nil
    end
    [file, result]
  end

  def tx(file, "search", word) do
    result = case :dets.lookup(file, word) do
      [{_, :valid} | _ ] -> 0
      _ -> nil
    end

    [file, result]
  end

  def tx(file, "remove", word) do
    result = case :dets.delete(file, word) do
      :ok -> 0
      _ -> nil
    end
    [file, result]
  end


  def tx(_, _, _) do
    raise "operation not supported. please use insert, search, or remove."
  end


  def open_file() do
    handle = :word_data
    name = handle
    :dets.open_file(handle, [{:file, name}])
    handle
  end


  def send_result([file, result]) do
    if result, do: IO.puts(to_string(result))
    file
  end

  def close_file(file) do
    :dets.close(file)
  end


end
