{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.gnome3.gnome-shell
    pkgs.gnome3.gnome-terminal
    # Add other GNOME packages you want to try
  ];
}
