class CacheService
    @@cache = {}

    def self.write(key, value)
        @@cache[key] = value
    end

    def self.read(key)
        @@cache[key]
    end
end