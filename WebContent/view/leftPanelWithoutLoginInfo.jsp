
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		
<!-- Left panel being added! -->
		
		<div class="col2">
			<!-- Column 2 start -->
			<br/>
			<blink><b>What is AdvocatesOnline?</b></blink>
			
			<p>AdvocatesOnline will help people to get the online consultation for your 
			legal matters from reputed advocates. You can even select the advocates of your 
			choice based on the query being answered by the many of advocates.</p>
			
			<b>Why AdvocatesOnline?</b>
			
			<p>Legal matters are very serious things and you just can't put your money for legal 
			consultation without knowing the capability of the advocate that you have choosen.</p>
			<p>So AdvocatesOnline will help the people who are looking for the right advocate to fight 
			for their cases.</p>
			
			<b>How AdvocatesOnline work?</b> 
			
			<p>AdvocatesOnline is a platform for people to find the right advocate and 
			for Advocates to provide proper online legal consultations by answering the peoples
			query on any legal matters. <a href="">click here to learn more..</a></p>
			
			<b>Looking for an Advocate?</b>
			
			<p>Signup now for free and post your query confidentially on AdvocatesOnline.</p>
			
			<c:url var="Learnmore" value="/user/learnMore" />
			<c:url var="login" value="/user/login" />
			<c:url var="SignUp" value="/user/newUser" />
			
			<h4>
				<a href= "${Learnmore}">Learn More</a>&nbsp;&nbsp;
				<a href= "${login}">Login</a>&nbsp;&nbsp;
				<a href= "${SignUp}">Signup for FREE</a>
			</h4>
			
			<b>If you are an Advocate?</b>
			
			<p>If you are an advocate and want to increase your customer base and in turn your revenues? 
			then don't just wait to signup for AdvocatesOnlines. </p>
			
			<c:url var="Learnmore" value="/user/learnMore" />
			<c:url var="login" value="/user/login" />
			<c:url var="SignUp" value="/user/newUser" />
			
			<h4>
				<a href= "${Learnmore}">Learn More</a>&nbsp;&nbsp;
				<a href= "${login}">Login</a>&nbsp;&nbsp;
				<a href= "${SignUp}">Signup</a>
			</h4>
			
			<!-- Column 2 end -->
		</div>
		
<!-- Left panel ends.. -->

