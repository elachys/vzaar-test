
class HomeController < ApplicationController
  def index
     #name =  upload['dictionary'].original_filename
        if(params[:dictionary])
            @fileload = (Benchmark.realtime {Word.new.saveFromCSV(params[:dictionary].tempfile)} * 1000).round(2)
        end

  end
end
