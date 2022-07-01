defmodule ClientTest do
  use ExUnit.Case, async: true
  doctest Elderflower.Client

  @tag :bogbody
  test "requests a board" do
    assert Elderflower.Client.get("https://bogbody.biz/46b8442a9e23599cb121a435216d2afb3a7748d3794201e30d601540983e0123") |>
      String.contains?("lupus")
  end

  @tag :bogbody
  test "updates a board" do
     payload = """ 
<time datetime="2022-06-30T19:14:47Z"></time>
<h2>Hi @roy who is also moving, so far it seems okay on the other side. We have a garden now.</h2>
<p>A thing I say a lot at work is “if it’s important, it’ll come back” and I think that applies here re: ephemerality of boards</p>
<h2>I know a lot more about string encoding/decoding now and I don't like it</h>
<p><a href="https://www.politico.com/story/2015/04/obama-bee-attack-easter-children-screaming-116704">Bees are good</a></p>
<p><a href="https://www.youtube.com/watch?v=bHKFc5Gi6L8">Backyard Photographs (in times of turmoil)</a></p>
<p>Trying to keep up with ya’ll but it’s tough. 😅 Feels like a lot is happening and I’m behind in reading it all.</p>
<hr>
<p>🌸rpj y u disrespect Paso Robles. “Wine country” hmmmm??? Also WHOLE COUNTRy of NEW ZEALAND and FRANCE.</p>
<p>“The first rule of self-actualization is you don’t talk about self-actualization”</p>
<p>I make newsletters
<a href="https://buttondown.email/nat">Photo Newsletter</a>
<a href="https://www.simplermachines.com/">Simpler Machines</a>
<a href="https://fierce-composer-7177.ck.page/d47e72b0a4">Nomad Exquisite</a></p>
"""

    assert %{status_code: 204 } = Elderflower.Client.put("https://bogbody.biz/46b8442a9e23599cb121a435216d2afb3a7748d3794201e30d601540983e0123", "~/Downloads/spring-83-keypair-2022-06-24-46b8442a9e23.txt", payload)
  end
end
