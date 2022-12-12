class Dkp < Formula
  desc "D2IQ Kubernetes Platform command line tool"
  homepage "https://www.d2iq.com/"
  version "2.3.1"

  depends_on "kubernetes-cli"
  depends_on "awscli" => :optional
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.d2iq.com/dkp/v2.3.1/dkp_v2.3.1_darwin_amd64.tar.gz"
    sha256 "95c87e4a1137a712fff9509724278d6deed6905400fce1d6ba121bac1b6db6f2"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://downloads.d2iq.com/dkp/v2.3.1/dkp_v2.3.1_linux_amd64.tar.gz"
    sha256 "72128326edfb1299f5bd19f0a64cae8f7d958f7e40d1db21864c61bfbe04a2ac"
  end
  conflicts_with "dkp"

  def install
    bin.install "dkp"
    generate_completions_from_executable(bin/"dkp", "completion")
  end

  test do
    assert_match "dkp: v#{version}", shell_output("#{bin}/dkp version | grep dkp")
  end
end


