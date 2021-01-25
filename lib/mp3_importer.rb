class MP3Importer
    attr_reader :path
    
    def initialize(path)
        @path = path
    end

    def files
        Dir.entries(self.path).select {|file| file.match(/^[^.].*\.mp3$/i)}
    end

    def import
        self.files.collect {|file| Song.new_by_filename(file)}
    end
end