function start_mongodb {
  launchctl load /usr/local/opt/mongodb/homebrew.mxcl.mongodb.plist
}

function stop_mongodb {
  launchctl unload /usr/local/opt/mongodb/homebrew.mxcl.mongodb.plist
}
