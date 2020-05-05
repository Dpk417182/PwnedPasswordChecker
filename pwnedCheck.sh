#!/bin/bash
sha=$(java HashTextTest.java)
echo "SHA1 hash is $sha"
firstfive="${sha:0:5}"
lastfive="${sha:35}"
echo "first five of hash is $firstfive"
echo "last five of hash is $lastfive"
curl "https://api.pwnedpasswords.com/range/${firstfive}" >output.txt
echo "any matches will appear here: $(grep -i "${lastfive}" output.txt)"
$SHELL