# Adapted from https://github.com/caskroom/homebrew-cask/pull/20512

cask 'docker' do
  version :latest
  sha256 :no_check

  url 'https://download.docker.com/mac/beta/Docker.dmg'
  name 'Docker'
  homepage 'https://beta.docker.com/docs/mac/'
  license :gratis

  app 'Docker.app'

  uninstall_preflight do
    system "#{staged_path}/Docker.app/Contents/MacOS/Docker", '--uninstall'
  end

  uninstall pkgutil: 'com.docker.docker'

  caveats <<-EOS.undent
    #{token} needs an installer to be run after cask install:
    sudo #{staged_path}/Docker.app/Contents/MacOS/Docker --token="your beta token"
  EOS
end
