#!/bin/sh
#!/bin/sh
. ./envvars.sh

test -f spurreader.image || ./buildspurtrunkreaderimage.sh
test -f SpurVMMaker.image && ./updatevmmakerimage.sh || buildspurtrunkvmmakerimage.sh

. ./getGoodSpurVM.sh

echo $VM SpurVMMaker.image BuildSpurReader64Image.st
$VM SpurVMMaker.image BuildSpurReader64Image.st
