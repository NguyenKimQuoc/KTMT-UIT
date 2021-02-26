# i -> $s3 ; j -> $s4 ; f -> $s0 ; g -> $s1 ; h -> $s2
main:	bne	$s3, $s4, else
	add	$s0, $s1, $s2
	j	exit
else:
	sub	$s3, $s1, $s2
exit: