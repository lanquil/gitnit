# https://devenv.sh/getting-started
{pkgs, ...}: {
  # https://devenv.sh/basics/

  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    cargo-insta # https://github.com/mitsuhiko/insta
    just
    cargo-cross
    podman # for cross
    rustup
  ];

  enterShell = ''
    # set -x  # for debug
    echo
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    echo "Environment variables to be set or put in an .env file: DIST_DIR, DEVBOARD"
    echo "Run 'just' for linters."
    echo "For help: https://just.systems/man/en/chapter_22.html"
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    echo
    ldd --version | head -n1
  '';

  # https://devenv.sh/languages/
  languages.rust.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  # https://devenv.sh/reference/options/#pre-commit
  pre-commit.hooks = {
    rustfmt.enable = true;

    alejandra.enable = true;
    deadnix.enable = true;
    statix.enable = true;

    shfmt.enable = true;
    shellcheck.enable = true;

    # markdownlint.enable = true;
    mdsh.enable = true; # execute example shell from Markdown files
    yamllint.enable = true;
    html-tidy.enable = true;

    actionlint.enable = true;

    commitizen.enable = true;
  };
  pre-commit.settings = {
    yamllint.relaxed = true;
  };
}
