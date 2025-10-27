{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

  };
  home-manager.users.nixos = {
    programs.zsh = {

      shellAliases = {
        ll = "eza -F -alg --time-style=long-iso";
        ls = "eza -F --time-style=long-iso";
        l = "ls";
        la = "eza -F -a --time-style=long-iso";
        tree = "eza -T --time-style=long-iso";
        cp = "cp -v";
        mv = "mv -v";
        mkdir = "mkdir -vp";
        cat = "bat";
        diff = "diff --color=auto";
        ip = "ip --color=auto";
        ln = "ln -nv";
        chmod = "chmod -c";
        chown = "chown -c";
        chattr = "chattr -V";
        md = "mkdir";
        rm = "rm -vi";
      };
    };
  };
}
