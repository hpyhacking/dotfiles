function start_mysql {
  launchctl load /usr/local/opt/mysql/homebrew.mxcl.mysql.plist
}

function stop_mysql {
  launchctl unload /usr/local/opt/mysql/homebrew.mxcl.mysql.plist
}
