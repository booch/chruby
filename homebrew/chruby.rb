require 'formula'

class Chruby < Formula

  homepage 'https://github.com/postmodern/chruby#readme'
  url 'https://github.com/downloads/postmodern/chruby/chruby-0.2.3.tar.gz'
  sha1 '6b8337ba2f48d3bbae680031b342680f39673af0'
  head 'https://github.com/postmodern/chruby.git'

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end

  def caveats; <<-EOS.undent
    For a system wide install, add the following to /etc/profile.d/chruby.sh.

      #!/bin/sh

      source #{HOMEBREW_PREFIX}/opt/chruby/share/chruby/chruby.sh

      RUBIES=(/opt/rubies/*)

    For a local install, add the following to ~/.bashrc or ~/.zshrc.

      #!/bin/sh

      source #{HOMEBREW_PREFIX}/opt/chruby/share/chruby/chruby.sh

      RUBIES=(~/.rubies/*)

    To use existing Rubies installed by RVM, rbenv or rbfu, set RUBIES to
    the following:

      RVM:   RUBIES=(~/.rvm/rubies/*)
      rbenv: RUBIES=(~/.rbenv/versions/*)
      rbfu:  RUBIES=('~/.rbfu/rubies/*)

    EOS
  end
end
