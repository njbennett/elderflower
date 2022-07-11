defmodule Elderflower.Server do

   def update_board(post) do
     { :ok, post }
   end

   def get_board(_public_key) do
     "some board contents"
   end
end
