#!/bin/bash

function fAdi()
{
	echo "$1, Bir komut giriniz : "
}
fAdi $USER
read komut
$komut
