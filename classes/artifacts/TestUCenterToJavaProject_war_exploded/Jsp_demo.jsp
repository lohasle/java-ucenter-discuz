<%
/**
 * ================================================
 * Discuz! Ucenter API for JAVA
 * ================================================
 */
%>
<%@page import="java.util.LinkedList"%>
<%@page import="api.ucenter.XMLHelper"%>
<%@page import="api.ucenter.Client"%>
<%
Client uc = new Client();
String result = uc.uc_user_login("test", "test");

LinkedList<String> rs = XMLHelper.uc_unserialize(result);
if(rs.size()>0){
	int $uid = Integer.parseInt(rs.get(0));
	String $username = rs.get(1);
	String $password = rs.get(2);
	String $email = rs.get(3);
	if($uid > 0) {
		response.addHeader("P3P"," CP=\"CURa ADMa DEVa PSAo PSDo OUR BUS UNI PUR INT DEM STA PRE COM NAV OTC NOI DSP COR\"");

		out.println("login success");
		out.println($username);
		out.println($password);
		out.println($email);
		
		String $ucsynlogin = uc.uc_user_synlogin($uid);
		out.println("login success"+$ucsynlogin);

		//TODO ... ....
		
		Cookie auth = new Cookie("auth", uc.uc_authcode($password+"\t"+$uid, "ENCODE"));
		auth.setMaxAge(31536000);
		//auth.setDomain("localhost");
		response.addCookie(auth);
		
		Cookie user = new Cookie("uchome_loginuser", $username);
		response.addCookie(user);
		
	} else if($uid == -1) {
		out.println("not exist");
	} else if($uid == -2) {
		out.println("erroe");
	} else {
		out.println("undefined");
	}
}else{
	out.println("Login failed");
	System.out.println(result);
}
%>