require 'formula'

class SshfsFuse <Formula
  url 'http://downloads.sourceforge.net/project/fuse/sshfs-fuse/2.2/sshfs-fuse-2.2.tar.gz'
  homepage 'http://fuse.sourceforge.net/sshfs.html'
  md5 '26e9206eb5169e87e6f95f54bc005a4f'


  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
