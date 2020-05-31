module WeatherHelper

  def FileNameArray(directry)
    array = []
    filenames = Dir::entries("app/assets/images/" + directry)
    filenames.each do |name|
      if (name != ".") and (name != "..")
        print name + "\n"
        array.push(directry + File.basename(name))
      end
    end
    return array
  end
end
