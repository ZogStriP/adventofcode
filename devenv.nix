{ pkgs, nixpkgs-ruby, ... }:
{
  env.RUBY_YJIT_ENABLE = true;

  languages.ruby.enable = true;
  languages.ruby.package = nixpkgs-ruby.packages.${pkgs.system}."ruby-3.3";
}
