if [[ "$_" == "$0" ]]
then
  echo Apply '"source"' to me. >&2
  exit 1
fi

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export SERIES_MYSQL_HOST=127.0.0.1
export SERIES_MYSQL_PORT=3306
export SERIES_MYSQL_SOCKET="$(mysql_config --socket)"
export SERIES_MYSQL_DATABASE=series
export SERIES_MYSQL_USER=series

# in "$dir/init.secret.bash"
#   export SERIES_MYSQL_PASSWORD=****
#   export MYSQL_PASSWORD=****
source "$dir/init.secret.bash"

if [[ "$(uname)" = Darwin ]]
then
  export SERIES_MYSQL_HOST=localhost

  launchctl setenv SERIES_MYSQL_HOST "$SERIES_MYSQL_HOST"
  launchctl setenv SERIES_MYSQL_PORT "$SERIES_MYSQL_PORT"
  launchctl setenv SERIES_MYSQL_SOCKET "$(mysql_config --socket)"
  launchctl setenv SERIES_MYSQL_DATABASE "$SERIES_MYSQL_DATABASE"
  launchctl setenv SERIES_MYSQL_USER "$SERIES_MYSQL_USER"
  launchctl setenv SERIES_MYSQL_PASSWORD "$SERIES_MYSQL_PASSWORD"
  launchctl setenv MYSQL_PASSWORD "$MYSQL_PASSWORD"
fi
