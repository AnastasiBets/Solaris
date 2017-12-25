class PagesController < ApplicationController
  def index
  	pp @posts = Post.all
  end

   def about
 
   end

   def contacts
 
   end

   def sponsors
 
   end

end
