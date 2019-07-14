dd if=/dev/zero of=file.dat count=1024 bs=1024

dd if=/dev/urandom of=file.txt bs=2048 count=10

dd if=/dev/urandom of=file.txt bs=1048576 count=100

dd if=/dev/zero of=file.dat count=1G bs=1024

bs - Blocksize
count - FileSize