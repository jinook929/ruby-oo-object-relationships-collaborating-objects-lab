class Song
    @@all = []    
    def self.all
        @@all
    end

    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def self.new_by_filename(filename)
        file_info = filename.match(/(.*) - (.*) - (.*).mp3/)
        song = Song.new(file_info[2])
        song.artist_name=(file_info[1])
        song
    end

    def artist_name=(name)
        found = Artist.all.find {|artist| artist.name == name}
        found ? self.artist = found : self.artist = Artist.new(name)
    end
end