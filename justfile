# <https://github.com/casey/just#quick-start>
# <https://just.systems/man/en/>

set dotenv-load := true

triple_armhf := "armv7-unknown-linux-gnueabihf"
triple_arm64 := "aarch64-unknown-linux-gnu"
target_dir := `cargo metadata --format-version 1 --no-deps | jq .target_directory`

# Execute formatters and linters
lint:
    pre-commit run --all-files
    cargo clippy

# Build armhf (armv7) binary (debug)
build-debug-armhf name:
    cross build --target={{triple_armhf}} --bin={{name}}

# Build armhf (armv7) binary (release)
build-armhf name:
    cross build --release --target={{triple_armhf}} --bin={{name}}

# vim: set ft=make :
