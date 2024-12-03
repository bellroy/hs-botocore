# botocore

[![Haskell-CI](https://github.com/bellroy/hs-botocore/actions/workflows/haskell-ci.yml/badge.svg)](https://github.com/bellroy/hs-botocore/actions/workflows/haskell-ci.yml)

This library provides types and a precise parser for the
"[`botocore`](https://github.com/boto/botocore/)" definitions of Amazon
Web Services (AWS) service APIs. These definitions are JSON files
which describe the operations, requests, responses, and errors for
each AWS service. It also includes a custom JSON parser which captures
details that [`aeson` cannot](https://github.com/haskell/aeson/issues/984).

This library exists to support
[`amazonka`](https://github.com/brendanhay/amazonka)'s generator and
is unlikely to be useful outside of that; therefore, we'll only push
it to Hackage if there's actual demand.
