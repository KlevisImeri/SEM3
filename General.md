P4QRDGJQ

netsh interface portproxy add v4tov4 listenaddress=89.134.9.56 listenport=80 connectaddress=172.28.243.134 connectport=80
netsh interface portproxy add v6tov4 listenaddress=2a02:ab88:c0c:4c00:e984:730e:7643:ca98 listenport=8080 connectaddress=fe80::215:5dff:fef5:87a connectport=8080



netsh interface portproxy add v6tov6 listenaddress=2a02:ab88:c0c:4c00::d8cb listenport=8080 connectaddress=fe80::215:5dff:fef5:87a connectport=8080
