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

  class ImageID
    # 属性値
    attr_reader :chart, :wind, :wave

    def self.FileNameArray(root, directry)
      array = []
      filenames = Dir::entries(root + directry)
      filenames.each do |name|
        if (name != ".") and (name != "..")
          array.push(directry + File.basename(name))
        end
      end
      return array
    end

    def initialize()
      @rootdir = "app/assets/images/"
      @chardir = "charts/"
      @winddir = "winds/"
      @wavedir = "waves/"

      @chart = self.class.FileNameArray(@rootdir, @chardir)
      @wind = self.class.FileNameArray(@rootdir, @winddir)
      @wave = self.class.FileNameArray(@rootdir, @wavedir)
    end
  end
end
