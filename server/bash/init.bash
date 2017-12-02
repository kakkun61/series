if [[ "$_" == "$0" ]]
then
  echo Apply '"source"' to me. >&2
  exit 1
fi

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# in "$dir/init.secret.bash"
#   export SERIES_MYSQL_PASSWORD=****
#   export MYSQL_PASSWORD=****
source "$dir/init.secret.bash"

export SERIES_MYSQL_HOST=127.0.0.1
export SERIES_MYSQL_PORT=3306
export SERIES_MYSQL_DATABASE=series
export SERIES_MYSQL_USER=series
