{
  pkgs,
  username,
  ...
}:

let
  inherit (import ./variables.nix) gitUsername;
in
{
  users.users = {
    "${username}" = {
      homeMode = "755";
      isNormalUser = true;
      description = "${gitUsername}";
      extraGroups = [
        "networkmanager"
        "wheel"
        "libvirtd"
        "scanner"
        "lp"
        "docker" 
      ];
      shell = pkgs.bash;
      ignoreShellProgramCheck = true;
      packages = with pkgs; [
        neofetch #system info
        onefetch # git info
        calcurse
        taskwarrior3 # todo
        ranger  # file-view
        zathura # ebook
        siyuan
        vscode
        jetbrains.pycharm-professional
        wechat-uos
        nix-output-monitor # view for nix build
        activitywatch
        vimPlugins.LazyVim # TODO not used
        wl-clipboard
        gh
        clash-nyanpasu
        baidupcs-go
        affine
        nur.repos.xddxdd.baidunetdisk
        nur.repos.xddxdd.uncategorized.rime-custom-pinyin-dictionary
        nur.repos.xddxdd.uncategorized.rime-dict
        nur.repos.xddxdd.uncategorized.rime-ice
      ];
    };
    # "newuser" = {
    #   homeMode = "755";
    #   isNormalUser = true;
    #   description = "New user account";
    #   extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    #   shell = pkgs.bash;
    #   ignoreShellProgramCheck = true;
    #   packages = with pkgs; [];
    # };
  };
}
