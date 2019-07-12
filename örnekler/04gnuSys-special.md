<!DOCTYPE html>
<HTML>
<HEAD>

<TITLE>[Chapter 8] 8.19 "Special&quot; Characters and Operators </TITLE>
<META
NAME="DC.title"
CONTENT="UNIX Power Tools"><META
NAME="DC.creator"
CONTENT="Jerry Peek, Tim O'Reilly &amp; Mike Loukides"><META
NAME="DC.publisher"
CONTENT="O'Reilly &amp; Associates, Inc."><META
NAME="DC.date"
CONTENT="1998-08-04T21:34:37Z"><META
NAME="DC.type"
CONTENT="Text.Monograph"><META
NAME="DC.format"
CONTENT="text/html"
SCHEME="MIME"><META
NAME="DC.source"
CONTENT="1-56592-260-3"
SCHEME="ISBN"><META
NAME="DC.language"
CONTENT="en-US"><META
NAME="generator"
CONTENT="Jade 1.1/O'Reilly DocBook 3.0 to HTML 4.0"><LINK
REV="made"
HREF="mailto:online-books@oreilly.com"
TITLE="Online Books Comments"><LINK
REL="up"
HREF="ch08_01.htm"
TITLE="8. How the Shell Interprets What You Type"><LINK
REL="prev"
HREF="ch08_18.htm"
TITLE="8.18 Here Documents "><LINK
REL="next"
HREF="ch08_20.htm"
TITLE="8.20 How Many Backslashes?"><link rel="canonical" href="https://docstore.mik.ua/orelly/unix/upt/ch08_19.htm" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, user-scalable=yes" />
<meta name="HandheldFriendly" content="true" />
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({
          google_ad_client: "ca-pub-0321943928525350",
          enable_page_level_ads: true
     });
</script>
</head>
<body style="background-color:white;margin:0 0 0 190px;padding: 5px;">
<noindex>
<center>
<a href="/">home</a> |
<a href="//docstore.mik.ua/orelly/bookshelfs.html">O'Reilly's CD bookshelfs</a> |
<a href="//docstore.mik.ua/manuals/freebsd.html">FreeBSD</a> | 
<a href="//docstore.mik.ua/manuals/linux.html">Linux</a> | 
<a href="//docstore.mik.ua/univercd/cc/td/doc/product/">Cisco</a> |
<a href="https://ciscoexam.online">Cisco Exam</a>
&nbsp;
<br/>
</center>
</noindex>
<div style="position:fixed;width:165px;height:100%;justify-content:center;left:5px;bottom:0;border-right:1px solid lightgrey;padding:5px;" id="aleftblk">
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<div style="position:absolute;top:50%;transform:translateY(-50%);" id="ablock1"></div></div>
<p id="blkadap1"></p>
<script type="text/javascript"><!--
if( window.innerWidth>800 && window.innerHeight>700 )
{
  document.getElementById('ablock1').innerHTML='<ins class="adsbygoogle" style="display:inline-block;width:160px;height:600px" data-ad-client="ca-pub-0321943928525350" data-ad-slot="5248352378"></ins>';
}
else
{
  document.getElementById('aleftblk').style.display='none';
  document.getElementById('ablock1').style.display='none';
  document.getElementsByTagName('body')[0].style.margin='0';
  document.getElementById('blkadap1').innerHTML='<ins class="adsbygoogle" style="display:block" data-ad-client="ca-pub-0321943928525350" data-ad-slot="3969618309" data-ad-format="auto"></ins>';
}
(adsbygoogle = window.adsbygoogle || []).push({});
//-->
</script>
<hr width=80% size=1><table border=0 width=100%><tr><td style="vertical-align: top;">
<DIV
CLASS="htmlnav">
<H1>
<IMG
SRC="gifs/smbanner.gif"
ALT="UNIX Power Tools"
USEMAP="#srchmap"
BORDER="0"></H1>
<MAP
NAME="srchmap">
<AREA
SHAPE="RECT"
COORDS="0,0,466,58"
HREF="index.htm"
ALT="UNIX Power Tools"><AREA
SHAPE="RECT"
COORDS="467,0,514,18"
HREF="../search/psrch.htm"
ALT="Search this book"></MAP>
<TABLE
WIDTH="515"
BORDER="0"
CELLSPACING="0"
CELLPADDING="0">
<TR>
<TD
ALIGN="LEFT"
VALIGN="TOP"
WIDTH="172">
<A
CLASS="SECT1"
HREF="ch08_18.htm"
TITLE="8.18 Here Documents ">
<IMG
SRC="../gifs/txtpreva.gif"
ALT="Previous: 8.18 Here Documents "
BORDER="0"></A>
</TD>
<TD
ALIGN="CENTER"
VALIGN="TOP"
WIDTH="171">
<B>
<FONT
FACE="ARIEL,HELVETICA,HELV,SANSERIF"
SIZE="-1">
Chapter 8<BR>How the Shell Interprets What You Type</FONT>
</B>
</TD>
<TD
ALIGN="RIGHT"
VALIGN="TOP"
WIDTH="172">
<A
CLASS="SECT1"
HREF="ch08_20.htm"
TITLE="8.20 How Many Backslashes?">
<IMG
SRC="../gifs/txtnexta.gif"
ALT="Next: 8.20 How Many Backslashes?"
BORDER="0"></A>
</TD>
</TR>
</TABLE>
&nbsp;<HR
ALIGN="LEFT"
WIDTH="515"
TITLE="footer"></DIV>
<DIV
CLASS="SECT1">
<H2
CLASS="sect1">
<A
CLASS="title"
NAME="UPT-ART-0419">
8.19 &quot;Special&quot; Characters and Operators </A>
</H2>
<P
CLASS="para">
<A
CLASS="indexterm"
NAME="AUTOID-8901">
</A>
<A
CLASS="indexterm"
NAME="AUTOID-8904">
</A>
Before you learn about
<SPAN
CLASS="link">
regular expressions (<A
CLASS="linkend"
HREF="ch26_01.htm#UPT-ART-7844"
TITLE="That's an Expression ">
26.1</A>
)</SPAN>
,
you should understand how
<SPAN
CLASS="link">
quoting (<A
CLASS="linkend"
HREF="ch08_14.htm"
TITLE="Bourne Shell Quoting ">
8.14</A>
)</SPAN>

works in UNIX.</P>
<P
CLASS="para">
Regular expressions use metacharacters. The shells also have metacharacters.
Metacharacters are simply characters that have a special meaning.
The problem occurs when you want to use a regular expression in a
shell script. 
Will the shell do something special with the character?
Or will it be passed unchanged to the program?
The 
<CODE
CLASS="literal">
$</CODE>

character is a good example.
<SPAN
CLASS="link">
 It could be the beginning of a variable name or it could bepart of a regular expression . (<A
CLASS="linkend"
HREF="ch26_02.htm"
TITLE="Don't Confuse Regular Expressions with Wildcards ">
26.2</A>
)</SPAN>

If you need a regular expression, you must know if any of the
characters of the expression are metacharacters, and must know 
the right way
to quote that character so that it is passed to the program without
being modified by the shell.</P>
<P
CLASS="para">
<A
CLASS="xref"
HREF="ch08_19.htm#UPT-ART-419-TAB-0"
TITLE="List of Special Characters and Their Meanings">
Table 8.3</A>
<A
CLASS="indexterm"
NAME="UPT-ART-419-IX-C-SHELL-CSH-SPECIAL-CHARACTERS-OPERATORS-IN">
</A>
<A
CLASS="indexterm"
NAME="UPT-ART-419-IX-SH-BOURNE-SHELL-SPECIAL-CHARACTERS-OPERATORS-IN">
</A>

is a table of special characters and operators in the C shell (<EM
CLASS="emphasis">
csh</EM>
)
and Bourne shell (<EM
CLASS="emphasis">
sh</EM>
).
The chart also includes several combinations of characters just to be
complete.
As in other parts of this book, the <EM
CLASS="emphasis">
sh</EM>
 entries apply to
<EM
CLASS="emphasis">
ksh</EM>
 and <EM
CLASS="emphasis">
bash</EM>
; the <EM
CLASS="emphasis">
csh</EM>
 entries apply to <EM
CLASS="emphasis">
tcsh</EM>
.</P>
<TABLE
CLASS="table">
<CAPTION
CLASS="table">
<A
CLASS="title"
NAME="UPT-ART-419-TAB-0">
Table 8.3: List of Special Characters and Their Meanings</A>
</CAPTION>
<THEAD
CLASS="thead">
<TR
CLASS="row"
VALIGN="TOP">
<TH
CLASS="entry"
ALIGN="LEFT"
ROWSPAN="1"
COLSPAN="1">
Character</TH>
<TH
CLASS="entry"
ALIGN="LEFT"
ROWSPAN="1"
COLSPAN="1">
Where</TH>
<TH
CLASS="entry"
ALIGN="LEFT"
ROWSPAN="1"
COLSPAN="1">
Meaning</TH>
<TH
CLASS="entry"
ALIGN="LEFT"
ROWSPAN="1"
COLSPAN="1">
Article</TH>
</TR>
</THEAD>
<TBODY
CLASS="tbody">
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
ESC</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Filename completion.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch09_08.htm"
TITLE="Filename Completion: Faster Filename Typing ">
9.8</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
RETURN</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Execute command.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch41_02.htm"
TITLE="stty and All That Stuff ">
41.2</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
space</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Argument separator.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch08_05.htm"
TITLE="Command-Line Evaluation ">
8.5</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
TAB</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Argument separator.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch08_05.htm"
TITLE="Command-Line Evaluation ">
8.5</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
TAB</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
bash</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Filename completion.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch09_08.htm"
TITLE="Filename Completion: Faster Filename Typing ">
9.8</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
#</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Start a comment.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch44_02.htm"
TITLE="Writing a Simple Shell Program ">
44.2</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
`</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Command substitution (backquotes).</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch09_16.htm"
TITLE="Command Substitution ">
9.16</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&quot;</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Weak quotes.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch08_14.htm"
TITLE="Bourne Shell Quoting ">
8.14</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&quot;</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Weak quotes.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
<A
CLASS="xref"
HREF="ch08_15.htm"
TITLE="Differences Between Bourne and C Shell Quoting ">
8.15</A>
,
<A
CLASS="xref"
HREF="ch08_14.htm"
TITLE="Bourne Shell Quoting ">
8.14</A>
</P>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
'</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Strong quotes.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch08_14.htm"
TITLE="Bourne Shell Quoting ">
8.14</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
'</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Strong quotes.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
<A
CLASS="xref"
HREF="ch08_15.htm"
TITLE="Differences Between Bourne and C Shell Quoting ">
8.15</A>
,
<A
CLASS="xref"
HREF="ch08_14.htm"
TITLE="Bourne Shell Quoting ">
8.14</A>

See \.</P>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
\</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Single-character quote.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch08_14.htm"
TITLE="Bourne Shell Quoting ">
8.14</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
\</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Single-character quote.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
<A
CLASS="xref"
HREF="ch08_15.htm"
TITLE="Differences Between Bourne and C Shell Quoting ">
8.15</A>
,
<A
CLASS="xref"
HREF="ch08_14.htm"
TITLE="Bourne Shell Quoting ">
8.14</A>
</P>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
$<CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Variable.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
<A
CLASS="xref"
HREF="ch06_01.htm#UPT-ART-1170"
TITLE="What Environment Variables Are Good For ">
6.1</A>
,
<A
CLASS="xref"
HREF="ch06_08.htm"
TITLE="Shell Variables ">
6.8</A>
</P>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
${<CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
}</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Same as <CODE
CLASS="literal">
$</CODE>
<CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch06_08.htm"
TITLE="Shell Variables ">
6.8</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
$<CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
:<CODE
CLASS="replaceable">
<I>
mod</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Edit <CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
 with modifier <CODE
CLASS="replaceable">
<I>
mod</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch09_06.htm"
TITLE="String Editing (Colon) Operators ">
9.6</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
${<CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
-<CODE
CLASS="replaceable">
<I>
default</I>
</CODE>
}</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
If <CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
 not set, use <CODE
CLASS="replaceable">
<I>
default</I>
</CODE>
.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch45_12.htm"
TITLE="Parameter Substitution ">
45.12</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
${<CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
=<CODE
CLASS="replaceable">
<I>
default</I>
</CODE>
}</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
If <CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
 not set, set it to <CODE
CLASS="replaceable">
<I>
default</I>
</CODE>
 and use that value.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch45_12.htm"
TITLE="Parameter Substitution ">
45.12</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
${<CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
+<CODE
CLASS="replaceable">
<I>
instead</I>
</CODE>
}</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
If <CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
 set, use <CODE
CLASS="replaceable">
<I>
instead</I>
</CODE>
.
Otherwise, null string.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch45_12.htm"
TITLE="Parameter Substitution ">
45.12</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
${<CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
?<CODE
CLASS="replaceable">
<I>
message</I>
</CODE>
}</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
If <CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
 not set, print <CODE
CLASS="replaceable">
<I>
message</I>
</CODE>
 (else default).
If <CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
 set, use its value.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch45_12.htm"
TITLE="Parameter Substitution ">
45.12</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
${<CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
#<CODE
CLASS="replaceable">
<I>
pat</I>
</CODE>
}</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
ksh, bash</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Value of <CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
 with smallest <CODE
CLASS="replaceable">
<I>
pat</I>
</CODE>
 deleted 
from start.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch09_07.htm"
TITLE="String Editing in ksh and bash ">
9.7</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
${<CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
##<CODE
CLASS="replaceable">
<I>
pat</I>
</CODE>
}</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
ksh, bash</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Value of <CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
 with largest <CODE
CLASS="replaceable">
<I>
pat</I>
</CODE>
 deleted 
from start.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch09_07.htm"
TITLE="String Editing in ksh and bash ">
9.7</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
${<CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
%<CODE
CLASS="replaceable">
<I>
pat</I>
</CODE>
}</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
ksh, bash</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Value of <CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
 with smallest <CODE
CLASS="replaceable">
<I>
pat</I>
</CODE>
 deleted from end.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch09_07.htm"
TITLE="String Editing in ksh and bash ">
9.7</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
${<CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
%%<CODE
CLASS="replaceable">
<I>
pat</I>
</CODE>
}</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
ksh, bash</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Value of <CODE
CLASS="replaceable">
<I>
var</I>
</CODE>
 with largest <CODE
CLASS="replaceable">
<I>
pat</I>
</CODE>
 deleted from end.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch09_07.htm"
TITLE="String Editing in ksh and bash ">
9.7</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
|</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Pipe standard output.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
<A
CLASS="xref"
HREF="ch01_04.htm"
TITLE="Using Pipes to Create a New Tool ">
1.4</A>
,
<A
CLASS="xref"
HREF="ch13_01.htm#UPT-ART-1023"
TITLE="Using Standard Input and Output">
13.1</A>
</P>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
|&amp;</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Pipe standard output and standard error.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch13_05.htm"
TITLE="Redirection in C Shell: Capture Errors, Too? ">
13.5</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
^</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh <EM
CLASS="emphasis">
only</EM>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Pipe character (obsolete).</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
^</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, bash</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Edit previous command line.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch11_05.htm"
TITLE="My Favorite Is ^^ ">
11.5</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&amp;</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Run program in background.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
<A
CLASS="xref"
HREF="ch01_27.htm"
TITLE="How Background Processing Works ">
1.27</A>
,
<A
CLASS="xref"
HREF="ch01_28.htm"
TITLE="Some Gotchas with Background Processing ">
1.28</A>
</P>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
?</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Match one character.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
<A
CLASS="xref"
HREF="ch01_16.htm"
TITLE="Wildcards ">
1.16</A>
,
<A
CLASS="xref"
HREF="ch15_02.htm"
TITLE="Filename Wildcards in a Nutshell ">
15.2</A>
</P>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
*</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Match zero or more characters.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
<A
CLASS="xref"
HREF="ch01_16.htm"
TITLE="Wildcards ">
1.16</A>
,
<A
CLASS="xref"
HREF="ch15_02.htm"
TITLE="Filename Wildcards in a Nutshell ">
15.2</A>
</P>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
;</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Command separator.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch08_05.htm"
TITLE="Command-Line Evaluation ">
8.5</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
;;</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
End of <EM
CLASS="emphasis">
case</EM>
 statement.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch44_05.htm"
TITLE="Test String Values with Bourne Shell case ">
44.5</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
~</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, ksh, bash</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Home directory.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch14_11.htm"
TITLE="Finding (Anyone's) Home Directory, Quickly ">
14.11</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
~<CODE
CLASS="replaceable">
<I>
user</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, ksh, bash</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Home directory of <CODE
CLASS="replaceable">
<I>
user</I>
</CODE>
.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch14_11.htm"
TITLE="Finding (Anyone's) Home Directory, Quickly ">
14.11</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
!</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, bash</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Command history.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch11_02.htm"
TITLE="History in a Nutshell ">
11.2</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
-</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Programs</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Start of optional argument.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch08_05.htm"
TITLE="Command-Line Evaluation ">
8.5</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
-</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Programs</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Read standard input. (Only certain programs.)</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch13_13.htm"
TITLE='The "Filename&quot; - '>
13.13</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
$#</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Number of arguments to script.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch44_15.htm"
TITLE="Handling Command-Line Arguments in Shell Scripts ">
44.15</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&quot;$@&quot;</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Original arguments to script.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch44_15.htm"
TITLE="Handling Command-Line Arguments in Shell Scripts ">
44.15</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
$*</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Arguments to script.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch44_15.htm"
TITLE="Handling Command-Line Arguments in Shell Scripts ">
44.15</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
$-</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Flags set in shell.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch02_11.htm"
TITLE="Faster ksh and bash Startup with $- Test ">
2.11</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
$?</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Status of previous command.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch44_07.htm"
TITLE="Exit Status of UNIX Processes ">
44.7</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
$$</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Process identification number.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch08_14.htm"
TITLE="Bourne Shell Quoting ">
8.14</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
$!</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Process identification number of last background job.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch07_12.htm"
TITLE="External Commands Send Signals to Set Variables ">
7.12</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
$&lt;</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Read input from terminal.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch09_11.htm"
TITLE="Repeating a Command with a foreach Loop ">
9.11</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<CODE
CLASS="replaceable">
<I>
cmd1</I>
</CODE>
 &amp;&amp; <CODE
CLASS="replaceable">
<I>
cmd2</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Execute <CODE
CLASS="replaceable">
<I>
cmd2</I>
</CODE>
 if <CODE
CLASS="replaceable">
<I>
cmd1</I>
</CODE>
 succeeds.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch44_09.htm"
TITLE="Testing Your Success ">
44.9</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<CODE
CLASS="replaceable">
<I>
cmd1</I>
</CODE>
 || <CODE
CLASS="replaceable">
<I>
cmd2</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Execute <CODE
CLASS="replaceable">
<I>
cmd2</I>
</CODE>
 if <CODE
CLASS="replaceable">
<I>
cmd1</I>
</CODE>
 fails.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch44_09.htm"
TITLE="Testing Your Success ">
44.9</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
$(..)</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
ksh, bash</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Command substitution.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
<A
CLASS="xref"
HREF="ch45_31.htm"
TITLE="Nested Command Substitution ">
45.31</A>
,
<A
CLASS="xref"
HREF="ch09_16.htm"
TITLE="Command Substitution ">
9.16</A>
</P>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
((..))</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
ksh, bash</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Arithmetic evaluation.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
\. <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Execute commands from <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>

in this shell.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch44_23.htm"
TITLE="Reading Files with the . and source Commands ">
44.23</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
:</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Evaluate arguments, return true.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch45_09.htm"
TITLE='The Unappreciated Bourne Shell  ":&quot; Operator'>
45.9</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
:</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Separate values in paths.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
<A
CLASS="xref"
HREF="ch06_04.htm"
TITLE="The PATH Environment Variable ">
6.4</A>
,
<A
CLASS="xref"
HREF="ch14_05.htm"
TITLE="Saving Time When You Change Directories: cdpath ">
14.5</A>
,
<A
CLASS="xref"
HREF="ch21_08.htm"
TITLE="The MAILCHECK and mail Variables Check More than Mail">
21.8</A>
</P>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
:</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Variable modifier.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch09_06.htm"
TITLE="String Editing (Colon) Operators ">
9.6</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
[]</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Match range of characters.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
<A
CLASS="xref"
HREF="ch01_16.htm"
TITLE="Wildcards ">
1.16</A>
,
<A
CLASS="xref"
HREF="ch15_02.htm"
TITLE="Filename Wildcards in a Nutshell ">
15.2</A>
</P>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
[]</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Test.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch44_20.htm"
TITLE="test: Testing Files and Strings ">
44.20</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
%<CODE
CLASS="replaceable">
<I>
job</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, ksh, bash</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Identify job number.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch12_01.htm#UPT-ART-0439"
TITLE="Job Control: Work Faster, Stop Runaway Jobs ">
12.1</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
(<CODE
CLASS="replaceable">
<I>
cmd</I>
</CODE>
;<CODE
CLASS="replaceable">
<I>
cmd</I>
</CODE>
)</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Run <CODE
CLASS="replaceable">
<I>
cmd</I>
</CODE>
<CODE
CLASS="literal">
;</CODE>
<CODE
CLASS="replaceable">
<I>
cmd</I>
</CODE>
 in a subshell.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch13_07.htm"
TITLE="The () Subshell Operators ">
13.7</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
{}</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, bash</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
In-line expansions.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
<A
CLASS="xref"
HREF="ch09_05.htm"
TITLE="Build Strings with {&nbsp;} ">
9.5</A>
</P>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
{<CODE
CLASS="replaceable">
<I>
cmd</I>
</CODE>
;<CODE
CLASS="replaceable">
<I>
cmd</I>
</CODE>
; }</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Like <CODE
CLASS="literal">
(</CODE>
<CODE
CLASS="replaceable">
<I>
cmd</I>
</CODE>
<CODE
CLASS="literal">
;</CODE>
<CODE
CLASS="replaceable">
<I>
cmd</I>
</CODE>
<CODE
CLASS="literal">
)</CODE>
 without a subshell.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch13_08.htm"
TITLE="Using {list} to Group Bourne Shell Commands ">
13.8</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&gt;<CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Redirect standard output.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch13_01.htm#UPT-ART-1023"
TITLE="Using Standard Input and Output">
13.1</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&gt;&gt;<CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Append standard output.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch13_01.htm#UPT-ART-1023"
TITLE="Using Standard Input and Output">
13.1</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&lt;<CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Redirect standard input.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch13_01.htm#UPT-ART-1023"
TITLE="Using Standard Input and Output">
13.1</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&lt;&lt;<CODE
CLASS="replaceable">
<I>
word</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Read until <CODE
CLASS="replaceable">
<I>
word</I>
</CODE>
, do command and variable substitution.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
<A
CLASS="xref"
HREF="ch08_18.htm"
TITLE="Here Documents ">
8.18</A>
,
<A
CLASS="xref"
HREF="ch09_14.htm"
TITLE="Using Here Documents for Form Letters, etc. ">
9.14</A>
</P>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&lt;&lt;\<CODE
CLASS="replaceable">
<I>
word</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh, sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Read until <CODE
CLASS="replaceable">
<I>
word</I>
</CODE>
, no substitution.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch08_18.htm"
TITLE="Here Documents ">
8.18</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&lt;&lt;-<CODE
CLASS="replaceable">
<I>
word</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Read until <CODE
CLASS="replaceable">
<I>
word</I>
</CODE>
, ignoring leading TABs.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch08_18.htm"
TITLE="Here Documents ">
8.18</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&gt;&gt;!&nbsp;<CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Append to <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
, even if <EM
CLASS="emphasis">
noclobber</EM>
 
set and <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
 doesn't exist.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch13_06.htm"
TITLE="Safe I/O Redirection with noclobber ">
13.6</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&gt;!&nbsp;<CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Output to <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
, even if <EM
CLASS="emphasis">
noclobber</EM>
 
set and <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
 exists.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch13_06.htm"
TITLE="Safe I/O Redirection with noclobber ">
13.6</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&gt;|&nbsp;<CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
ksh, bash</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Output to <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
, even if <EM
CLASS="emphasis">
noclobber</EM>
 
set and <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
 exists.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch13_06.htm"
TITLE="Safe I/O Redirection with noclobber ">
13.6</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&gt;&amp; <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
csh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Redirect standard output and standard error 
to <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch13_05.htm"
TITLE="Redirection in C Shell: Capture Errors, Too? ">
13.5</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
&gt; <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Redirect output file descriptor <CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
 to 
<CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch45_21.htm"
TITLE="n&gt;&amp;m: Swap Standard Output and Standard Error ">
45.21</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
&gt;&gt; <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Append output file descriptor <CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
 to <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
&lt; <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Redirect input file descriptor <CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
 from <CODE
CLASS="replaceable">
<I>
file</I>
</CODE>
.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&lt;&amp;<CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Take standard input from file descriptor <CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&lt;&amp;-</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Close standard input.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch45_10.htm"
TITLE="Removing a File Once It's Opened&nbsp;- for Security and Easy Cleanup">
45.10</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&gt;&amp;<CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Use file descriptor <CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
 as standard output.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch45_21.htm"
TITLE="n&gt;&amp;m: Swap Standard Output and Standard Error ">
45.21</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
&gt;&amp;-</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Close standard output.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch45_21.htm"
TITLE="n&gt;&amp;m: Swap Standard Output and Standard Error ">
45.21</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
&lt;&amp;<CODE
CLASS="replaceable">
<I>
n</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Connect input file descriptor <CODE
CLASS="replaceable">
<I>
n</I>
</CODE>
 to file 
descriptor <CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch45_22.htm"
TITLE="Handling Files Line-by-Line ">
45.22</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
&lt;&amp;-</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Close input file descriptor <CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch45_21.htm"
TITLE="n&gt;&amp;m: Swap Standard Output and Standard Error ">
45.21</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<CODE
CLASS="replaceable">
<I>
n</I>
</CODE>
&gt;&amp;<CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<P
CLASS="para">
Connect output file descriptor <CODE
CLASS="replaceable">
<I>
n</I>
</CODE>
 to file 
descriptor <CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
.</P>
</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch45_21.htm"
TITLE="n&gt;&amp;m: Swap Standard Output and Standard Error ">
45.21</A>
</TD>
</TR>
<TR
CLASS="row"
VALIGN="TOP">
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
&gt;&amp;-</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
sh</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
Close output file descriptor <CODE
CLASS="replaceable">
<I>
m</I>
</CODE>
.</TD>
<TD
CLASS="entry"
ROWSPAN="1"
COLSPAN="1">
<A
CLASS="xref"
HREF="ch45_21.htm"
TITLE="n&gt;&amp;m: Swap Standard Output and Standard Error ">
45.21</A>
</TD>
</TR>
</TBODY>
</TABLE>
<A
CLASS="indexterm"
NAME="AUTOID-9590">
</A>
<A
CLASS="indexterm"
NAME="AUTOID-9591">
</A>
<DIV
CLASS="sect1info">
<P
CLASS="SECT1INFO">
- <SPAN
CLASS="authorinitials">
BB</SPAN>
, <SPAN
CLASS="authorinitials">
JP</SPAN>
</P>
</DIV>
</DIV>
<DIV
CLASS="htmlnav">
<P>
</P>
<HR
ALIGN="LEFT"
WIDTH="515"
TITLE="footer"><TABLE
WIDTH="515"
BORDER="0"
CELLSPACING="0"
CELLPADDING="0">
<TR>
<TD
ALIGN="LEFT"
VALIGN="TOP"
WIDTH="172">
<A
CLASS="SECT1"
HREF="ch08_18.htm"
TITLE="8.18 Here Documents ">
<IMG
SRC="../gifs/txtpreva.gif"
ALT="Previous: 8.18 Here Documents "
BORDER="0"></A>
</TD>
<TD
ALIGN="CENTER"
VALIGN="TOP"
WIDTH="171">
<A
CLASS="book"
HREF="index.htm"
TITLE="UNIX Power Tools">
<IMG
SRC="../gifs/txthome.gif"
ALT="UNIX Power Tools"
BORDER="0"></A>
</TD>
<TD
ALIGN="RIGHT"
VALIGN="TOP"
WIDTH="172">
<A
CLASS="SECT1"
HREF="ch08_20.htm"
TITLE="8.20 How Many Backslashes?">
<IMG
SRC="../gifs/txtnexta.gif"
ALT="Next: 8.20 How Many Backslashes?"
BORDER="0"></A>
</TD>
</TR>
<TR>
<TD
ALIGN="LEFT"
VALIGN="TOP"
WIDTH="172">
8.18 Here Documents </TD>
<TD
ALIGN="CENTER"
VALIGN="TOP"
WIDTH="171">
<A
CLASS="index"
HREF="index/idx_0.htm"
TITLE="Book Index">
<IMG
SRC="../gifs/index.gif"
ALT="Book Index"
BORDER="0"></A>
</TD>
<TD
ALIGN="RIGHT"
VALIGN="TOP"
WIDTH="172">
8.20 How Many Backslashes?</TD>
</TR>
</TABLE>
<HR
ALIGN="LEFT"
WIDTH="515"
TITLE="footer"><IMG
SRC="../gifs/smnavbar.gif"
USEMAP="#map"
BORDER="0"
ALT="The UNIX CD Bookshelf Navigation"><MAP
NAME="map">
<AREA
SHAPE="RECT"
COORDS="0,0,73,21"
HREF="../index.htm"
ALT="The UNIX CD Bookshelf"><AREA
SHAPE="RECT"
COORDS="74,0,163,21"
HREF="index.htm"
ALT="UNIX Power Tools"><AREA
SHAPE="RECT"
COORDS="164,0,257,21"
HREF="../unixnut/index.htm"
ALT="UNIX in a Nutshell"><AREA
SHAPE="RECT"
COORDS="258,0,321,21"
HREF="../vi/index.htm"
ALT="Learning the vi Editor"><AREA
SHAPE="RECT"
COORDS="322,0,378,21"
HREF="../sedawk/index.htm"
ALT="sed &amp; awk"><AREA
SHAPE="RECT"
COORDS="379,0,438,21"
HREF="../ksh/index.htm"
ALT="Learning the Korn Shell"><AREA
SHAPE="RECT"
COORDS="439,0,514,21"
HREF="../lrnunix/index.htm"
ALT="Learning the UNIX Operating System"></MAP>
</DIV>
</td></tr><tr><td style="vertical-align: top; width: 200px;">
<br><br>
<script type="text/javascript"><!--
google_ad_client = "pub-0321943928525350";
/* 160x600, o-rightfixed */
google_ad_slot = "0404752187";
google_ad_width = 160;
google_ad_height = 600;
//-->
</script>
<script type="text/javascript"
src="//pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
</td></tr>
</table>

<!-- ********************* FOOTER ********************** -->
<noindex>
<br>


<center>

<br>

<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- o-footer adaptiv -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-0321943928525350"
     data-ad-slot="3969618309"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});

function addLink() {
    var body_element = document.getElementsByTagName('body')[0];
    var selection;
    selection = window.getSelection();
    var pagelink = " docstore.mik.ua" + window.location.pathname; 
    var copytext = selection + pagelink;
    var newdiv = document.createElement('div');
    newdiv.style.position='absolute';
    newdiv.style.left='-99999px';
    body_element.appendChild(newdiv);
    newdiv.innerHTML = copytext;
    selection.selectAllChildren(newdiv);
    window.setTimeout(function() {
      body_element.removeChild(newdiv);
    },0);
}
document.oncopy = addLink;

</script>

</center>


<br>
<hr size=1>


<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script></BODY>
</HTML>

