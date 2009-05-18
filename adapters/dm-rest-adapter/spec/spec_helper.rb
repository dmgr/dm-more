require 'pathname'
require 'rubygems'

gem 'dm-core', '0.10.0'

require 'dm-core'
require 'fakeweb'
require 'spec'

ROOT = Pathname(__FILE__).dirname.parent.expand_path

# use local dm-serializer if running from dm-more directly
lib = ROOT.parent.parent.join('dm-serializer', 'lib').expand_path
$LOAD_PATH.unshift(lib) if lib.directory?

require ROOT + 'lib/rest_adapter'

DataMapper.setup(:default, 'rest://admin:secret@localhost:4000/?format=xml')

Dir[ROOT + 'spec/fixtures/**/*.rb'].each { |rb| require rb }

FakeWeb.allow_net_connect = false
