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


<jsp:include page="NoLoginHeader.jsp"></jsp:include>
<div id="main">
	
	<style>
		body{
			font-family: Century Gothic, sans-serif;
			font-size:13px;
		}

		p, h1, form, button{
			border:0; margin:0; padding:0;
		}

		
	</style>
		
		<div style="width: 40%; padding-top: 15px; padding-left:10px; padding-right:5px; float: left; height: 450px; border: 1px white;">
		<p>
			AdvocatesOniline is a platform for advocates to connect with their clients, friends, 
			colleagues and like minded advocates across the world and to collaborate across 
			all boundaries in a safe and secure environment. AdvocatesOnline helps to enhance 
			your professional skills and for mutually beneficial professional needs while 
			sharing your experience and knowledge.
		</p>
		</div>
		<div style="width: 40%; padding-top: 15px; float: left; border: 1px white; height: 450px">
		<b><img alt="client" src="resources/image/People.png">&nbsp;&nbsp;Clients:</b><br><br>
		<p>
			AdvocatesOnline offers client to post their legal case and then to find the right advocate for your legal matters.
			AdvocatesOnline also helps to search and view professional profile information of advocates and to collaborate 
			with them in a real time environment.
		</p>
		<br>
		<a href="">Login</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=getServletContext().getContextPath()%>/RegisterUser.jsp">Signup</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#">Learn more</a>
		<br>
		<br>
		<b><img alt="advocates" src="resources/image/Boss.png">&nbsp;&nbsp;Advocates:</b><br><br>
		<p>
			AdvocatesOnline offers advocates to view relevant clients cases and answer them and to connect with them 
			for further legal assistance. Advocates are provided with self publishing web page where client can view 
			their qualification, experience and no of cases won etc. It also helps in maintaining existing 
			clients case details, court processing to store the final judgment of the case.
		</p>
		<br>
		<a href="AdvocatesLogin.jsp">Login</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="<%=getServletContext().getContextPath()%>/RegisterAdvocate.jsp">Signup</a>&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#">Learn more</a>
		<br>
		</div>
		<div style="border: 1px white; height: 100%; padding-top: 15px;" >
			<b><img alt="client" src="resources/image/search.png">&nbsp;&nbsp;Advocates Search</b><br><br>
			<div id="stylized" class="myform">
				<form id="form" name="form" method="post" action="index.html">
					<div>
						<label>Name
							<span class="small">Advocate Name </span>
						</label>
						<input type="text" name="name" id="name" />
					</div>
					<div>
						<label>Legal Category:
							<span class="small">Select req. category</span>
						</label>
						<input type="text" name="email" id="email" />
					</div>
					<div>
						<label>Pincode
							<span class="small">Area pincode</span>
						</label>
						<input type="text" name="password" id="password" />
					</div>
					<div>
						<button type="submit">Search</button>
					</div>
					<div class="spacer"></div>										
				</form>				
			</div>
		</div>
	
	<!-- 
	<div id="stylized" class="myform">
		
		
<form id="form" name="form" method="post" action="index.html">
 <h1>Sign-up form</h1>
<p>This is the basic look of my form without table</p>

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
</div>-->
	
</div>
<jsp:include page="Footer.jsp"></jsp:include>