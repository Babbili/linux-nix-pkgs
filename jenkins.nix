{ pkgs ? import <nixpkgs> { system = "x86_64-linux"; } 
}:
pkgs.dockerTools.buildLayeredImage {
    name = "nix-jenkins";
    tag = "v1.0.1";
    contents = [pkgs.jenkins];
}