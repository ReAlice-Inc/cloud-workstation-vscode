echo "Starting Code OSS"

export PATH=$PATH:/usr/local/go/bin
export HOME=/home/user
export EDITOR_PORT=80

function start_vscode {
  runuser user -c -l "cd $HOME && code serve-web --port=${EDITOR_PORT} --host=0.0.0.0 --without-connection-token --accept-server-license-terms"
}

function kill_container {
  echo "VSCode exited, terminating container."
  ps x | awk {'{print $1}'} | awk 'NR > 1' | xargs kill
}

(start_vscode || kill_container)