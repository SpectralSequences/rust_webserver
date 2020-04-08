#!/bin/sh

WORKING_DIRECTORY="$(pwd)"

cd "$( dirname $0 )"
cd ..

cargo test --verbose
cargo clippy --all-targets -- -D warnings
cargo clippy --features "concurrent" --all-targets -- -D warnings -A unused_imports

bin/build-wasm.sh

cd compressor
cargo clippy -- -D warnings

cd $WORKING_DIRECTORY
