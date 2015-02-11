if [[ ! -o interactive ]]; then
    return
fi

compctl -K _p p

_p() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(p commands)"
  else
    completions="$(p completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
