#!/bin/bash
sha=$(java HashTextTest.java)
echo "SHA1 hash is $sha"
firstfive="${sha:0:5}"
lastfive="${sha:35}"
echo "first five of hash is $firstfive"
echo "last five of hash is $lastfive"
link="https://api.pwnedpasswords.com/range/${firstfive}"
$(curl --silent "${link}" > output.txt)
var=$(grep -i "${lastfive}" output.txt)
echo "leaked this many times: ${var:36}"
$SHELL