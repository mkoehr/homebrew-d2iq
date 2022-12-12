class Dkp < Formula
  desc "D2IQ Kubernetes Platform command line tool"
  homepage "https://www.d2iq.com/"
  version "2.4"

  depends_on "kubernetes-cli"
  depends_on "awscli" => :optional
  
  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.d2iq.com/dkp/v2.4.0/dkp_v2.4.0_darwin_amd64.tar.gz"
    sha256 "4e99d18b7fd9d309b56e6818942d69eb7de631fcc3ecbf6663c46baa9db6fd25"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://downloads.d2iq.com/dkp/v2.4.0/dkp_v2.4.0_linux_amd64.tar.gz"
    sha256 "23d185b9f8dfb09cfeb4c9f32ad324355b40ce6a4099c47eb780701b246978d3"
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


