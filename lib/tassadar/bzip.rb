module Tassadar
  class BZip
    class DefaultToRbzip < Exception; end

    def self.decompress(data)
      case @@implementation
      when 'bzip2'
        Bzip2.uncompress(data)
      when 'rbzip2'
        RBzip2::Decompressor.new(StringIO.new(data)).read
      end
    end

    def self.set_implementation(implementation)
      raise DefaultToRbzip if ENV['RBZIP2'] && implementation != 'rbzip2'
      @@implementation = implementation
    end
  end
end