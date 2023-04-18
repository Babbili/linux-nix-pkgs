{ pkgs ? import <nixpkgs> { system = "x86_64-linux"; } 
}:
pkgs.dockerTools.buildLayeredImage {
    name = "nix-jenkins";
    tag = "latest";
    contents = [pkgs.jenkins];
}