export PROXYCHAINS_CONF_FILE="~/.proxychains.conf"
alias fuck="proxychains4 -f ~/.proxychains.conf"

function restart_proxy {
  launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.shadowsocks-tunnel.plist
  launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.shadowsocks-libev.plist
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.shadowsocks-tunnel.plist
  launchctl load ~/Library/LaunchAgents/homebrew.mxcl.shadowsocks-libev.plist
}

function set_http_proxy {
  export HTTP_PROXY="http://127.0.0.1:30081"
  export HTTPS_PROXY="http://127.0.0.1:30081"
  export http_proxy="http://127.0.0.1:30081"
  export https_proxy="http://127.0.0.1:30081"
}

function unset_http_proxy {
  unset HTTP_PROXY
  unset HTTPS_PROXY
  unset http_proxy
  unset https_proxy
}

function start_http_proxy {
  launchctl load /usr/local/opt/privoxy/homebrew.mxcl.privoxy.plist
  set_http_proxy
}

function stop_http_proxy {
  launchctl unload /usr/local/opt/privoxy/homebrew.mxcl.privoxy.plist
  unset_http_proxy
}

function reload_pac {
  networksetup -listallnetworkservices | awk 'NR>1' | while read SERVICE ; do
    if networksetup -getautoproxyurl "$SERVICE" | grep '^Enabled: Yes' >/dev/null; then
      networksetup -setautoproxystate "$SERVICE" off
      networksetup -setautoproxystate "$SERVICE" on
      echo "$SERVICE" bounced.
    fi
  done
}
