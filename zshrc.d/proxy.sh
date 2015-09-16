function set_proxy {
  export HTTP_PROXY='127.0.0.1:1080'
  export HTTPS_PROXY='127.0.0.1:1080'
}

function unset_proxy {
  unset HTTP_PROXY
  unset HTTPS_PROXY
}
