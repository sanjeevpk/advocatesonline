<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/ddsmoothmenu.css" />

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/ddsmoothmenu.js">

/***********************************************
* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "smoothmenu1", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

ddsmoothmenu.init({
	mainmenuid: "smoothmenu2", //Menu DIV id
	orientation: 'v', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu-v', //class added to menu's outer DIV
	method: 'toggle', // set to 'hover' (default) or 'toggle'
	arrowswap: true, // enable rollover effect on menu arrow images?
	//customtheme: ["#804000", "#482400"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>
</head>
<body>
<div id="smoothmenu1" class="ddsmoothmenu">
<ul>
<li><a href="http://www.dynamicdrive.com">Item 1</a></li>
<li><a href="http://www.dynamicdrive.com">Folder 0</a>
  <ul>
  <li><a href="http://www.dynamicdrive.com">Sub Item 1.1</a></li>
  <li><a href="http://www.dynamicdrive.com">Sub Item 1.2</a></li>
  <li><a href="http://www.dynamicdrive.com">Sub Item 1.3</a></li>
  <li><a href="http://www.dynamicdrive.com">Sub Item 1.4</a></li>
  <li><a href="http://www.dynamicdrive.com">Sub Item 1.2</a></li>
  <li><a href="http://www.dynamicdrive.com">Sub Item 1.3</a></li>
  <li><a href="http://www.dynamicdrive.com">Sub Item 1.4</a></li>
  </ul>
</li>
<li><a href="http://www.dynamicdrive.com">Folder 1</a>
  <ul>
  <li><a href="http://www.dynamicdrive.com">Sub Item 1.1</a></li>
  <li><a href="http://www.dynamicdrive.com">Sub Item 1.2</a></li>
  <li><a href="http://www.dynamicdrive.com">Sub Item 1.3</a></li>
  <li><a href="http://www.dynamicdrive.com">Sub Item 1.4</a></li>
  <li><a href="http://www.dynamicdrive.com">Sub Item 1.2</a></li>
  <li><a href="http://www.dynamicdrive.com">Sub Item 1.3</a></li>
  <li><a href="http://www.dynamicdrive.com">Sub Item 1.4</a></li>
  </ul>
</li>
<li><a href="http://www.dynamicdrive.com">Item 3</a></li>
<li><a href="http://www.dynamicdrive.com">Folder 2</a>
  <ul>
  <li><a href="http://www.dynamicdrive.com">Sub Item 2.1</a></li>
  <li><a href="http://www.dynamicdrive.com">Folder 2.1</a>
    <ul>
    <li><a href="http://www.dynamicdrive.com">Sub Item 2.1.1</a></li>
    <li><a href="http://www.dynamicdrive.com">Sub Item 2.1.2</a></li>
    <li><a href="http://www.dynamicdrive.com">Folder 3.1.1</a>
		<ul>
    		<li><a href="http://www.dynamicdrive.com">Sub Item 3.1.1.1</a></li>
    		<li><a href="http://www.dynamicdrive.com">Sub Item 3.1.1.2</a></li>
    		<li><a href="http://www.dynamicdrive.com">Sub Item 3.1.1.3</a></li>
    		<li><a href="http://www.dynamicdrive.com">Sub Item 3.1.1.4</a></li>
    		<li><a href="http://www.dynamicdrive.com">Sub Item 3.1.1.5</a></li>
		</ul>
    </li>
    <li><a href="http://www.dynamicdrive.com">Sub Item 2.1.4</a></li>
    </ul>
  </li>
  </ul>
</li>
<li><a href="http://www.dynamicdrive.com/style/">Item 4</a></li>
</ul>
<br style="clear: left" />
</div>
</body>
</html>