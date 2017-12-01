if [[ "$_" == "$0" ]]
then
  echo Apply '"source"' to me. >&2
  exit 1
fi

dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$dir/init.secret.bash"
