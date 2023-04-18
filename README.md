# Create a container image using Nix


**Nix** purely functional Package manager for Linux, system configuration, reproducable builds & deployments

> https://nixos.org
> 
> https://search.nixos.org/packages


## Installation

install Nix on Linux with the command
```bash
curl -L https://nixos.org/nix/install | sh
```

use `nix-env -iA PKG_NAME` command to download the packge on your machine

use `nix-shell -p PKG_NAME` command to run a shell of the packge

```bash
nix-shell -p python3 go rustc cowsay

(nix-shell)$: python --version
python 3.9.16

(nix-shell)$: go version
go version go3.9.16 linux/amd64

(nix-shell)$: rustc --version
rustc 1.64.0

(nix-shell)$: cowsay "mulipule languages in one shell"

 __________________________________ 
< multipule languages in one shell >
 ---------------------------------- 
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```


## Create a Jenkins docker image using Nix

create `jenkins.nix` file in the root directory

build the image with the command

```bash
nix-build jenkins.nix -o result
```
```bash
ls -a
.  ..  jenkins.nix  README.md  result
```

load the `nix-jenkins:latest` image to docker desktop ,
```bash
docker load -i ./result
```
now you got `nix-jenkins:latest` image built, go to docker desktop and scan it and run it, or push it container registry 

