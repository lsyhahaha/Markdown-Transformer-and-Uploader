### Stanford CS144
* [CS144视频（b站）](https://www.bilibili.com/video/BV1wt41167iN?from=search&seid=12807244912122184980)
* [CS144课程网站（包括pdf、project）](https://github.com/CS144)

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
  

<img src="https://raw.githubusercontent.com/huangrt01/Markdown-Transformer-and-Uploader/master/Notes/Stanford-CS144/003.jpg" alt="Lego TCP/IP" style="zoom:60%;" />

##### 1-2 The four layer Internet model
<img src="https://raw.githubusercontent.com/huangrt01/Markdown-Transformer-and-Uploader/master/Notes/Stanford-CS144/001.jpg" alt="4-layer" style="zoom:60%;" />

* 4 layer: 利于reuse
* Internet: end-hosts, links and routers
  * Link Layer: 利用link在end host和router或router和router之间传输数据, hop-by-hop逐跳转发; e.g. Ethernet and WiFi
  * Network Layer: datagrams, Packet: (Data, Header(from, to))
    * packets可能失去/损坏/复制，no guarantees
    * must use the IP
    * may be out of order
  * Transport Layer: TCP(Transmission Control Protocol)负责上述Network的局限性，controls congestion
    * 比如视频传输不需要TCP，可以用UDP(User Datagram Protocol),不保证传输
  * Application Layer

* two extra things

  * IP is the "thin waist"   
  * the 7-layer OSI Model

<img src="https://raw.githubusercontent.com/huangrt01/Markdown-Transformer-and-Uploader/master/Notes/Stanford-CS144/002.jpg" alt="7-layer" style="zoom:60%;" />

##### 1-3 The IP Service
* Link Frame (IP Datagram(IP Data(Data, Hdr), IP Hdr), Link Hdr )
* The IP Service Model的特点
  * Datagram: (Data, IP SA, IP DA)，每个router有forwarding table，类比为postal service中的letter
  * Unreliable
  * Best effort
  * Connectionless : no per-flow state, mis-sequenced