function start_redis {
  launchctl load /usr/local/opt/redis/homebrew.mxcl.redis.plist
}

function stop_redis {
  launchctl unload /usr/local/opt/redis/homebrew.mxcl.redis.plist
}
