<!--
 * Copyright 2013. All rights reserved by AdvocatesOnline. 
 * Do not copy or try to reproduce the source file.
 * Please write to admin@advocatesonline.com for any communications.
 *
 * Author           : Sanjeev Kulkarni
 * Project          : AdvocatesOnline
 * Created On       : 08-Jun-2013 12:04:47 AM
 *
 *<b>Revision History</b>
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *<b> Sl No.  | Changed By                    | Date & Time          		| Remarks                                                                     
 *-------------------------------------------------------------------------------------------------------------------------------------------------
 *     1      | Sanjeev Kulkarni              | 15-May-2013 8:46:11 PM      | Initial Version
 * 
 *
-->


<jsp:include page="Header.jsp"></jsp:include>
<div id="main">
	
	<style>
		body{
font-family: Century Gothic, sans-serif;
font-size:12px;
}
p, h1, form, button{border:0; margin:0; padding:0;}
.spacer{clear:both; height:1px;}
/* ----------- My Form ----------- */
.myform{
margin:0 auto;
width:30%;
align:center;
padding:14px;
}

/* ----------- stylized ----------- */
#stylized{
#border:solid 1px #000000;
background:#ffffff;
}
#stylized h1 {
font-size:14px;
font-weight:bold;
margin-bottom:8px;
}
#stylized p{
font-size:11px;
color:#666666;
margin-bottom:20px;
border-bottom:solid 1px #b7ddf2;
padding-bottom:10px;
}
#stylized label{
display:block;
font-weight:bold;
text-align:right;
width:140px;
float:left;
}
#stylized .small{
color:#666666;
display:block;
font-size:11px;
font-weight:normal;
text-align:right;
width:140px;
}
#stylized input{
float:left;
font-size:12px;
padding:4px 2px;
border:solid 1px #000000;
width:200px;
margin:2px 0 20px 10px;
}
#stylized button{
clear:both;
margin-left:150px;
width:125px;
height:31px;
background:#000000 url(img/button.png) no-repeat;
text-align:center;
line-height:31px;
color:#FFFFFF;
font-size:11px;
font-weight:bold;
}
</style>
	
		<div id="stylized" class="myform">
<form id="form" name="form" method="post" action="index.html">
<!-- <h1>Sign-up form</h1>
<p>This is the basic look of my form without table</p> -->

<div>
<label>Name
<span class="small">Add your name</span>
</label>
<input type="text" name="name" id="name" />
</div>
<div>
<label>Email
<span class="small">Add a valid address</span>
</label>
<input type="text" name="email" id="email" />
</div>
<div>
<label>Password
<span class="small">Min. size 6 chars</span>
</label>
<input type="text" name="password" id="password" />
</div>
<div>
<button type="submit">Sign-up</button>
</div>
<div class="spacer"></div>

</form>
</div>
	
</div>
<jsp:include page="Footer.jsp"></jsp:include>