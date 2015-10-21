function start_rabbitmq {
  launchctl load /usr/local/opt/rabbitmq/homebrew.mxcl.rabbitmq.plist
}

function stop_rabbitmq {
  launchctl unload /usr/local/opt/rabbitmq/homebrew.mxcl.rabbitmq.plist
}
