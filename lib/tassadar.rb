$:.unshift File.join(File.dirname(__FILE__), 'lib')

require 'tassadar/mpq'
require 'tassadar/sc2/replay'
require 'tassadar/bzip'

begin
  require 'bzip2'
  BZIP = Tassadar::BZip.set_implementation('bzip2')
rescue LoadError, Tassadar::BZip::DefaultToRbzip
  require 'rbzip2'
  BZIP = Tassadar::BZip.set_implementation('rbzip2')
end

module Tassadar
end
