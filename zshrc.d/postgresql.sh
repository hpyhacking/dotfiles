function start_pg {
  launchctl load /usr/local/opt/postgresql/homebrew.mxcl.postgresql.plist
}

function stop_pg {
  launchctl unload /usr/local/opt/postgresql/homebrew.mxcl.postgresql.plist
}
