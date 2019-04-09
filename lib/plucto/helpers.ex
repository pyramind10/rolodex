defmodule Plucto.Helpers do
  alias Plucto.Page

  def range(%Page{} = page, padding \\ 3) do
    %{
      left: left_range(page, padding),
      right: right_range(page, padding)
    }
  end

  def left_range(%Page{last_page: last_page, current_page: current_page}, padding \\ 3) do
    if last_page < current_page do
      nil
    else
      if current_page <= 1 do
        nil
      else
        offset_left = current_page - padding

        if offset_left <= 1 do
          1..(current_page - 1)
        else
          offset_left..(current_page - 1)
        end
      end
    end
  end

  def right_range(%Page{last_page: last_page, current_page: current_page}, padding \\ 3) do
    if last_page < current_page do
      nil
    else
      if current_page >= last_page do
        nil
      else
        offset_right = current_page + padding

        if offset_right >= last_page do
          (current_page + 1)..last_page
        else
          (current_page + 1)..offset_right
        end
      end
    end
  end
end
