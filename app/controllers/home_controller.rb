
class HomeController < ApplicationController
  def index
     #name =  upload['dictionary'].original_filename
        if(params[:dictionary])
            @fileload = (Benchmark.realtime {Word.new.saveFromUpload(params[:dictionary])} * 1000).round(2)
        end

  end
end
