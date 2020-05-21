### Stanford CS144
* [CS144视频（b站）](https://www.bilibili.com/video/BV1wt41167iN?from=search&seid=12807244912122184980)
* [CS144课程网站（包括pdf、project）](https://github.com/CS144)

#### What the Internet is
##### 1-0 The Internet and IP Introduction
* internet layer: Internet Protocol, IP address, packet's path
* 彩蛋：世一大惺惺相惜
<img src="Stanford-CS144/005.jpg" alt="Stanford-THU" style="zoom:60%;" />

* 用`ping`和`traceroute`看IP地址; 光纤2/3光速，8637km - RTT=86ms
##### 1-1 A day in the life of an application
* Networked Applications: connectivity, bidirectional and reliable data stream
* Byte Stream Model: A - Internet - B, server和A、B均可中断连接
* World Wide Web(HTTP: HyperText Transfer Protocol)
  * request: GET, PUT, DELETE, INFO, 400(bad request) 
  * GET - response(200, OK)  , 200代表有效
  * document-centric: "GET/HTTP/1.1", "HTTP/1.1 200 OK \<contents of the index.html\>"
* BitTorrent: peer-to-peer model
  * breaks files into "pieces" and the clients join and leave "swarms" of clients
  * 先下载torrent file -- tracker存储lists of other clients
  * dynamically exchange data
* Skype: proprietary system, a mixed system
  * two clients： A -- (Internet + Rendezvous server) -- NAT -- B
  
  * NAT(Network Address Translator): 连接的单向性，使得A只能通过Rendezvous server询问B是否直连A =>reverse connection
  
  * Rendezvous server
  
  * 如果模式是A -- NAT-- (Internet + Rendezvous server) -- NAT -- B，Skype用Relay来间接传递信息
  

<img src="Stanford-CS144/003.jpg" alt="Lego TCP/IP" style="zoom:60%;" />

##### 1-2 The four layer Internet model
<img src="Stanford-CS144/001.jpg" alt="4-layer" style="zoom:60%;" />

* 4 layer: 利于reuse
* Internet: end-hosts, links and routers
  * Link Layer: 利用link在end host和router或router和router之间传输数据, hop-by-hop逐跳转发; e.g. Ethernet and WiFi
  * Network Layer: datagrams, Packet: (Data, Header(from, to))
    * packets可能失去/损坏/复制，no guarantees
    * must use the IP
    * may be out of order
  * Transport Layer: TCP(Transmission Control Protocol)负责上述Network的局限性，controls congestion
    * sequence number -> 保序
    * ACK(acknowledgement of receipt)，如果发信人没收到就resend
    * 比如视频传输不需要TCP，可以用UDP(User Datagram Protocol),不保证传输
* Application Layer
  
* two extra things

  * IP is the "thin waist"   
  * the 7-layer OSI Model

<img src="Stanford-CS144/002.jpg" alt="7-layer" style="zoom:60%;" />

##### 1-3 The IP Service
* Link Frame (IP Datagram(IP Data(Data, Hdr), IP Hdr), Link Hdr )
* The IP Service Model的特点
  * Datagram: (Data, IP SA, IP DA)，每个router有forwarding table，类比为postal service中的letter
  * Unreliable: 失去/损坏/复制，保证只在必要的时候不可靠（比如queue congestion）
  * Best-effort attempt
  * Connectionless : no per-flow state, mis-sequenced
* IP设计简单的原因
  * minimal, faster, streamlined
  * end-to-end(在end points implement features)
  * build a variety of reliable/unreliable services on top
  * works over any link layer

* the IP Service Model
  1. tries to prevent packets looping forever (实现：在每个datagram的header加hop-count field: time to live TTL field, 比如从128开始decrement)
  2. will fragment packets if they're too long (e.g. Ethernet, 1500bytes)
  3. header checksum：增强可靠性
  4. allows for new versions of IP
  5. allows for new options to be added to header (由router处理新特性，慎重使用)

<img src="Stanford-CS144/004.jpg" alt="IPv4 Datagram" style="zoom:60%;" />

* IPv4 Datagram
  * Protocol ID: 6->TCP; IANA(Internet Assigned Numbers Authority)

##### 1-4 A Day in the Life of a Packet
* 3-way handshake
  1. client: SYN 
  2. server: SYN/ACK
  3. client: ACK
* IP packets
  * IP address + TCP port(web server通常是80)
  * hops, Routers: wireless access point (WiFi的第一次hop)
  * forwarding table
  * default router

* wireshark: 
  * [谈谈Linux中的TCP重传抓包分析](https://segmentfault.com/a/1190000019734707)

##### 1-5 Principle: Packet switching principle
* packet: self-contained
* packet switching: independently for each arriving packet, pick its outgoing link. If the link is free, send it. Else hold the packet for later.
* source packet: (Data, (dest, C, B, A))  => 只存destination，每个switch有table
* two consequences
  * simple packet forwarding: No per-flow state required，state不需要store/add/remove
  * efficient sharing of links: busty data traffic; statistical multiplexing => 对packet一视同仁，可共享links

##### 1-6 Principle: Layering

* 一种设计理念，layers are functional components, they communicate sequentially 
* edit -> compile -> link -> execute
  * compiler: self-contained, e.g. lexical analysis, parsing the code, preprocessing declarations, code generation and optimization