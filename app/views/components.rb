# app/views/components.rb
require 'opal'
require 'webpack/client_and_server.js'
require 'hyper-mesh'
require 'reactrb/auto-import'
require 'hyper-trace'
if React::IsomorphicHelpers.on_opal_client?
  require 'opal-jquery'
  require 'browser'
  require 'browser/interval'
  require 'browser/delay'
  # add any additional requires that can ONLY run on client here
end
require 'hyper-router'
require 'react_router'
require 'models'
require_tree './components'
