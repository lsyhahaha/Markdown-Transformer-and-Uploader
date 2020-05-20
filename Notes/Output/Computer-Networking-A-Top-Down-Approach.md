### Computer-Networking-A-Top-Down-Approach

#### 0.资料

* [Stanford CS144视频（b站）](https://www.bilibili.com/video/BV1wt41167iN?from=search&seid=12807244912122184980)

* [质量最高的pdf](https://download.csdn.net/download/mnt248/10350433)

* 习题
  * https://github.com/moranzcw/Computer-Networking-A-Top-Down-Approach-NOTES
  * https://github.com/HanochShi/Supplements-ComputerNetworking-ATopDownApproach-7th-ed
  * https://github.com/myk502/Top-Down-Approach

### Stanford CS144
* [Stanford CS144视频（b站）](https://www.bilibili.com/video/BV1wt41167iN?from=search&seid=12807244912122184980)

#### What the Internet is
##### 1-0 The Internet and IP Introduction
* internet layer: Internet Protocol, IP address, packet's path
##### 1-1 A day in the life of an application
* Networked Applications: connectivity, bidirectional and reliable data stream
* Byte Stream Model: A - Internet - B, server和A、B均可中断连接
* World Wide Web(HTTP: HyperText Transfer Protocol)
  * request: GET, PUT, DELETE, INFO, 400(bad request) 
  * GET - response(200, OK)  , 200代表有效
  * document-centric: "GET / HTTP/1.1", "HTTP/1.1 200 OK"
* BitTorrent: peer-to-peer model
  * breaks files into "pieces" and the clients join and leave "swarms" of clients
  * 先下载torrent file -- tracker存储lists of other clients
  * dynamically exchange data
* Skype: proprietary system, a mixed system
  * two clients： A -- (Internet + Rendezvous server) -- NAT -- B
  * NAT(Network Address Translator): 连接的单向性，使得A只能通过Rendezvous server询问B是否直连A =>reverse connection
  * Rendezvous server
  * 如果模式是A -- NAT-- (Internet + Rendezvous server) -- NAT -- B，Skype用Relay来间接传递信息

##### 1-2 The four layer Internet model
<img src="https://raw.githubusercontent.com/huangrt01/Markdown-Transformer-and-Uploader/master/Notes/Computer-Networking-A-Top-Down-Approach/001.jpg" alt="4-layer" style="zoom:60%;" />

* Internet: end-hosts, links and routers
  * Link Layer: links, hop-by-hop逐跳转发; e.g. Ethernet and WiFi
  * Network Layer: datagrams, Packet: (Data, Header(from, to))

