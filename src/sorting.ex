defmodule Sorting do
    def quicksort([]), do: []
    def quicksort([pivot | t]) do
        quicksort(for x <- t, x <= pivot, do: x)
        ++ [pivot] ++
        quicksort(for x <- t, x > pivot, do: x)
    end
end
