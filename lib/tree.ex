defmodule Tree do
  @moduledoc """
  Documentation for `Tree`.
  """

  alias __MODULE__
  use Audit

  defstruct left: nil, item: nil, right: nil, __audit_trail__: nil

  def add(nil, item), do: %Tree{item: item}
  def add(tree = %Tree{left: l, item: i, right: r}, item) do
      cond do
      item < i -> %Tree{audit(tree) | left: add(l, item)}
      item > i -> %Tree{audit(tree) | right: add(r, item)}
      true -> tree
      end
  end
end
