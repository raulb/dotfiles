redact_cat() {
  sed -E \
    -e 's/(AWS_ACCESS_KEY_ID=).*/\1[*****]/' \
    -e 's/(AWS_SECRET_ACCESS_KEY=).*/\1[*****]/' \
    "$@"
}
alias cat="redact_cat"
