with (import <nixpkgs> {});

let
    tjShellHooks = ''
        cd $HOME/Tigerjython
        wget --timestamping --timeout=3 --show-progress --quiet https://tjgroup.ch/download/tigerjython2.jar
        echo "run: cd $HOME/Tigerjython; java -jar tigerjython2.jar"
    '';
 
    basePackages = [
        stdenv
        jre8
        wget
        cacert
        openssl
        zlib
    ];

    applicationPackages = [
        firefox
        thonny
    ];

in mkShell {
  buildInputs = [basePackages applicationPackages];
  shellHook = tjShellHooks;
}
