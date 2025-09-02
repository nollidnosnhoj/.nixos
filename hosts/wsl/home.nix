{pkgs,...}: {
    imports = [
        ../../modules/home/git/git.nix
        ../../modules/home/editors/neovim
        ../../modules/home/programs/dev.nix
        ../../modules/home/shell
    ];

    home.packages = with pkgs; [
        bitwarden-cli # password manager CLI
        eza # ls replacement
        entr # perform action when file change
        fd # find replacement
        file # Show file information
        gtrash # rm replacement, put deleted files in system trash
        imagemagick
        jq # JSON processor
        killall
        lsd # modern ls
        man-pages # extra man pages
        openssl
        onefetch # fetch utility for git repo
        ripgrep # grep replacement
        shfmt # bash formatter
        tdf # cli pdf viewer
        treefmt # project formatter
        tldr
    ];
}