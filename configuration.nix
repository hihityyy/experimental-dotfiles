{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_6_6;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Minsk";

  i18n.defaultLocale = "en_US.UTF-8";

fonts.packages = with pkgs; [
  inter
  iosevka
  pkgs.nerd-fonts.iosevka
];

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    windowManager.bspwm.enable = true;
    xkb = {
      layout = "us,ru";
      options = "grp:alt_shift_toggle";
    };
  };

  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
  };

  users.users."hity" = {
    isNormalUser = true;
    description = "hity";
    shell = pkgs.fish;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;
  programs.fish.enable = true;
  environment.systemPackages = with pkgs; [
    bspwm
    btop
    cargo
    cmatrix
    dunst
    feh
    fish
    gcc
    git
    imv
    kitty
    lazygit
    libnotify
    librewolf
    lsd
    maim
    mpv
    mupdf
    neovim
    pfetch
    polybar
    rofi
    rumno
    rustc
    sxhkd
    vesktop
    wget
    xsecurelock
    xclip
    xkb-switch
    xprop
    yazi
  ];

  system.stateVersion = "26.05";
}
