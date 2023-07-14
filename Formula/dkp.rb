class Dkp < Formula
  desc "D2IQ Kubernetes Platform command line tool"
  homepage "https://www.d2iq.com/"
  version "2.5.1"

  depends_on "kubernetes-cli"
  depends_on "awscli" => :optional
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.d2iq.com/dkp/v2.5.1/dkp_v2.5.1_darwin_amd64.tar.gz"
    sha256 "095f942c7e99ddaad4d81ff469b871d6212451c456888253452fb23efae4d3c3"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://downloads.d2iq.com/dkp/v2.5.1/dkp_v2.5.1_linux_amd64.tar.gz"
    sha256 "747b1825a2a4ff90d0ca49db09db938477e0690e410e5292392f3fa57e4e98f4"
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


