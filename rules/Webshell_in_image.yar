rule Webshell_in_image
{
meta:
	description = "Identifies a webshell or backdoor in image files."
	author = "@bartblaze"
	date = "2020-01"
	tlp = "White"
	
strings:
	$gif = {47 49 46 38 37 61}
	$png = {89 50 4E 47 0D 0A 1A 0A}
	$jpeg = {FF D8 FF E0}
	$bmp = {42 4D}
	
	$s1 = "<%@ Page Language=" ascii wide
	$s2 = "<?php" ascii wide
	$s = "eval(" ascii wide
	
condition:
	( $gif at 0 and any of ($s*) ) or 
	( $png at 0 and any of ($s*) ) or 
	( $jpeg at 0 and any of ($s*) ) or
	( $bmp at 0 and any of ($s*) )
}