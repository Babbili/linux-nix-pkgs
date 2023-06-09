{ pkgs ? import <nixpkgs> {} 
}:
pkgs.redis.overrideAttrs (old: {
    makeFlags = old.makeFlags ++ ["USE_SYSTEMD=no"];
    preBuild = ''
      makeFlagsArray=(PREFIX="$out"
                      CC="${pkgs.musl.dev}/bin/musl-gcc -static"
                      CFLAGS="-I${pkgs.musl.dev}/include"
                      LDFLAGS="-L${pkgs.musl.dev}/lib")
    '';
    postInstall= "rm -f $out/bin/redis-{benchmark, check-*, cli}";
})