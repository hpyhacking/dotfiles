export PROXYCHAINS_CONF_FILE="~/.proxychains.conf"
alias fuck="proxychains4 -f ~/.proxychains.conf"

function start_ss_proxy {
  launchctl load /usr/local/opt/shadowsocks-libev/homebrew.mxcl.shadowsocks-tunnel.plist
  launchctl load /usr/local/opt/shadowsocks-libev/homebrew.mxcl.shadowsocks-libev.plist
  sudo launchctl load /usr/local/opt/dnsmasq/homebrew.mxcl.dnsmasq.plist
  sudo networksetup -switchtolocation GFW
}

function stop_ss_proxy {
  launchctl unload /usr/local/opt/shadowsocks-libev/homebrew.mxcl.shadowsocks-tunnel.plist
  launchctl unload /usr/local/opt/shadowsocks-libev/homebrew.mxcl.shadowsocks-libev.plist
  sudo launchctl unload /usr/local/opt/dnsmasq/homebrew.mxcl.dnsmasq.plist
  sudo networksetup -switchtolocation Automatic
}

function set_http_proxy {
  export HTTP_PROXY="http://127.0.0.1:30081"
  export HTTPS_PROXY="http://127.0.0.1:30081"
}

function unset_http_proxy {
  unset HTTP_PROXY
  unset HTTPS_PROXY
}

function start_http_proxy {
  launchctl load /usr/local/opt/privoxy/homebrew.mxcl.privoxy.plist
  set_http_proxy
}

function stop_http_proxy {
  launchctl unload /usr/local/opt/privoxy/homebrew.mxcl.privoxy.plist
  unset_http_proxy
}

