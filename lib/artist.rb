class Artist
    @@all = []

    def self.all
        @@all
    end

    attr_accessor :name

    def initialize(name)
        @name = name
        self.class.all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        found = self.all.find {|artist| artist.name == name}
        found ? found : Artist.new(name)
    end

    def print_songs
        Song.all.each {|song| puts song.name if song.artist == self}
    end
end