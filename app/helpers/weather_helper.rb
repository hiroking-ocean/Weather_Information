module WeatherHelper

  class ImageID
    # 属性値
    attr_reader :chart, :wind, :wave, :sorted

    def initialize()
      @rootdir = "app/assets/images/"
      @chartdir = "charts/"
      @winddir = "winds/" 
      @wavedir = "waves/"

      @chart = file_name_array(@rootdir, @chartdir)
      @wind = file_name_array(@rootdir, @winddir)
      @wave = file_name_array(@rootdir, @wavedir)
      @sorted = sort(@chart, @wind, @wave)
    end

    def parse(times)
      parsed = []
      times.each do |time|
        parse = DateTime.parse(time + "+0900")
        parsed.push(parse.to_s)
      end
      return parsed
    end

    private
      
      def file_name_array(root, directry)
        array = []
        filenames = Dir::entries(root + directry)
        filenames.each do |name|
          if (name != ".") and (name != "..")
            array.push(File.basename(name, ".jpg"))
          end
        end
        return array
      end

      def with_extention(root, directry)
        withex = []
        array = file_name_array(root, directry)
        array.each do |item|
          withex.push(directry + item + ".jpg")
        end
        return withex
      end

      def sort(charts, winds, waves)
        sorted = []
        sorted.push(charts)
        sorted.push(winds)
        sorted.push(waves)
        sorted.flatten!
        sorted.uniq!
        sorted.sort!
        return sorted
      end


    # まず、すべてのファイルのナンバーを併せて整列させる
  end
end
