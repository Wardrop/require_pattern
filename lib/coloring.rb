module ReqPat
  class Coloring
    def self.red(msg)
      "\033[31m#{msg}\033[0m\n"
    end

    def self.yellow(msg)
      "\033[33m#{msg}\033[0m\n"
    end
  end
end
