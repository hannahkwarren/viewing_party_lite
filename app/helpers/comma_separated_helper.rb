module CommaSeparatedHelper
  
  def csl(genres)
    string = ""
    count = genres.count
        
    genres.each do |hash|
      string += (hash[:name])
      count -= 1
      if count != 0
        string += ', '
      end
    end

    string
  end

end
