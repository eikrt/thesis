{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "latex-env";

  buildInputs = [
    (pkgs.texlive.combine {
      inherit (pkgs.texlive) scheme-full latexmk biber dvipng dvisvgm amsmath ulem hyperref wrapfig capt-of;
    })
    pkgs.gnuplot          # Optional: for plotting
    pkgs.imagemagick      # Optional: image processing
    pkgs.python3          # Optional: for Python scripts
  ];

  shellHook = ''
    echo "LaTeX environment is ready."
  '';
}

