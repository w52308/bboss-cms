<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="com.frameworkset.platform.config.ConfigManager"%>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>
<%@ include file="/common/jsp/csscontextmenu-lhgdialog.jsp"%>
<%@ page import="com.frameworkset.platform.security.AccessControl"%>
<%
	response.setHeader("Cache-Control", "no-cache"); 
	response.setHeader("Pragma", "no-cache"); 
	response.setDateHeader("Expires", -1);  
	response.setDateHeader("max-age", 0);

	AccessControl control = AccessControl.getInstance();
	control.checkManagerAccess(request,response);
	String reFlush = "false";
	if (request.getAttribute("reFlush") != null) {
		reFlush = "true";
	}
	String restype=(String)request.getParameter("restypeId");	
	String restypeName=request.getParameter("restypeName");
	String parent_resId = request.getParameter("parent_resId");
	
	String rootpath = request.getContextPath();
	//是否可以设置机构资源
	boolean isOrg = ConfigManager.getInstance().getConfigBooleanValue("enableorgrole");
%>
<html>
	<head>
		<title>资源列表</title>
<script language="JavaScript" src="common.js" type="text/javascript"></script>
<script src="../scripts/func.js"></script>
<script language="JavaScript" src="<%=rootpath%>/sysmanager/resmanager/common.js" type="text/javascript"></script>
<script language="JavaScript" src="<%=rootpath%>/sysmanager/include/pager.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=rootpath%>/html/js/commontool.js"></script>
<SCRIPT language="javascript">	
var jsAccessControl = new JSAccessControl("#DAE0E9","#F6F8FB","#F6F8FB");
function getResDetail(e,resId,resTypeId,resTypeName,title)
{
	
	document.all("selectId").value = resId;
	if (jsAccessControl.setBackColor(e)){
	//	getPropertiesToolbar().location.href="properties_toolbar.jsp?resId2="+resId+"&resTypeId2="+resTypeId+"&resTypeName="+resTypeName+"&title="+title;
	}
}
	
function dealRecord(dealType) {
	var resId = document.all("selectId").value;
	var isSelect = false;
    var outMsg;
	    
    for (var i=0;i<ResSearchList.elements.length;i++) {
		var e = ResSearchList.elements[i];
			
		if (e.name == 'checkBoxOne'){
			if (e.checked){
	       		isSelect=true;
	       		break;
		    }
		}
    }
	if(resId.length <1 && !isSelect){
		$.dialog.alert("<pg:message code='sany.pdp.common.operation.remove.select'/>!",function(){},null,"<pg:message code='sany.pdp.common.alert'/>");
		return;
	}
	
	if(resId.length >1 && !isSelect){
		$.dialog.alert("<pg:message code='sany.pdp.common.operation.remove.select'/>!",function(){},null,"<pg:message code='sany.pdp.common.alert'/>");
		return;
	}
	
    if (isSelect){
    	if (dealType==1){
    		//outMsg = "你确定要删除吗？(相关资源将一并删除,但系统资源不会被删除)";
    		$.dialog.confirm("<pg:message code='sany.pdp.delete.comfirm'/>?",function(){
        		ResSearchList.target = "delRes";
        		ResSearchList.action="saveCmsResOp.jsp?opType=delete&restypeName=<%=restypeName%>";
				ResSearchList.submit();
	 			return true;
    		});
		} 
    }
	return false;
}

function refsh(){
	//alert(document.location);
	document.location.reload();
}

function getRes(resId,restypeId){
	
	var url = "${pageContext.request.contextPath}/purviewmanager/resmanager/cmsModifyRes.jsp?restypeId=<%=restype%>&restypeName=<%=restypeName%>&resId="+ resId;
	$.dialog({close:refsh,title:'<pg:message code="sany.pdp.resourcemanage.modify.resource"/>',width:760,height:560, content:'url:'+url,lock: true});
	//ResSearchList.action=url;
	//window.showModalDialog(url,window,"dialogWidth:"+(800)+"px;dialogHeight:"+(600)+"px;help:no;scroll:auto;status:no");
	//ResSearchList.submit();
	//document.location = document.location;
}
function newRes(){
	var url = "${pageContext.request.contextPath}/purviewmanager/resmanager/cmsnewres.jsp?restype=<%=restype%>&restypeName=<%=restypeName%>";
	$.dialog({close:refsh,title:'<pg:message code="sany.pdp.resourcemanage.create.resource"/>',width:760,height:560, content:'url:'+url,lock: true});
	////window.location.href="<%=rootpath%>/sysmanager/resmanager/cmsnewres.jsp?restype=<%=restype%>&restypeName=<%=restypeName%>";
	//window.showModalDialog(url,window,"dialogWidth:"+(800)+"px;dialogHeight:"+(600)+"px;help:no;scroll:auto;status:no");
	//document.location = document.location; 
}

//资源访问授权
function accredit(dealType) {
	var resId = document.all("selectId").value;
	var isSelect = false;
    var outMsg;
	    
    for (var i=0;i<ResSearchList.elements.length;i++) {
		var e = ResSearchList.elements[i];
			
		if (e.name == 'checkBoxOne'){
			if (e.checked){
	       		isSelect=true;
	       		break;
		    }
		}
    }
	
	
    if (isSelect){
    	if (dealType==1){
    		outMsg = "<pg:message code='sany.pdp.delete.comfirm'/>?";
        	if (confirm(outMsg)){
        		ResSearchList.action="<%=rootpath%>/resmanager/resource.do?method=getAllResList&restypeName=<%=restype%>";
				ResSearchList.submit();
	 			return true;
			}
		} 
    }//else{
    //	alert("至少要选择一条记录！");
    //	return false;
   	//}
	return false;
	    			//ResSearchList.action="<%=rootpath%>/resmanager/resource.do?method=getAllResList&restypeName=<%=restypeName%>&restype=<%=restype%>";
		
}

function resBatchUser(){
	var obj = document.getElementsByName("checkBoxOne");
	var resId2 = "";
	var resName2 = "";
	var i = 0;
	for(var count = 0; count < obj.length; count++){
		if(obj[count].checked){
			if(resId2==""){
				resId2 = obj[count].resId2; 
			}else{
				resId2 += "^^" + obj[count].resId2;
			}
			if(resName2==""){
				resName2 = obj[count].resName2;
			}else{
				resName2 += "^^" + obj[count].resName2;
			}
			i ++;
		}
	}
	if(i > 1){
		var url = '${pageContext.request.contextPath}/purviewmanager/resmanager/user_iframe.jsp?resId2='+resId2+'&resTypeId2=<%=restype%>&resName2='+resName2+"&isBatch=true";
		$.dialog({close:refsh,title:'<pg:message code="sany.pdp.resourcemanage.confer.user"/>',width:760,height:560, content:'url:'+url,lock: true});
	}else if(i == 0){
		$.dialog.alert("<pg:message code='sany.pdp.resourcemanage.choose.resource'/>!",function(){},null,"<pg:message code='sany.pdp.common.alert'/>");
		return false;
	}else{
		$.dialog.alert("<pg:message code='sany.pdp.choose.two.record'/>!",function(){},null,"<pg:message code='sany.pdp.common.alert'/>");
		return false;
	}
}

function resBatchRole(){
	var obj = document.getElementsByName("checkBoxOne");
	var resId2 = "";
	var resName2 = "";
	var i = 0;
	for(var count = 0; count < obj.length; count++){
		if(obj[count].checked){
			if(resId2==""){
				resId2 = obj[count].resId2; 
			}else{
				resId2 += "^^" + obj[count].resId2;
			}
			if(resName2==""){
				resName2 = obj[count].resName2;
			}else{
				resName2 += "^^" + obj[count].resName2;
			}
			i ++;
		}
	}
	if(i > 1){
		var url = '${pageContext.request.contextPath}/purviewmanager/resmanager/role_iframe.jsp?resId2='+resId2+'&resTypeId2=<%=restype%>&resName2='+resName2+"&isBatch=true&resTypeName=<%=restypeName%>&title="+resId2;
		$.dialog({close:refsh,title:'<pg:message code="sany.pdp.resourcemanage.confer.role"/>',width:760,height:560, content:'url:'+url,lock: true});
	}else if(i == 0){
		$.dialog.alert("<pg:message code='sany.pdp.resourcemanage.choose.resource'/>!",function(){},null,"<pg:message code='sany.pdp.common.alert'/>");
		return false;
	}else{
		$.dialog.alert("<pg:message code='sany.pdp.choose.two.record'/>!",function(){},null,"<pg:message code='sany.pdp.common.alert'/>");
		return false;
	}
}

function resBatchOrg(){
	var obj = document.getElementsByName("checkBoxOne");
	var resId2 = "";
	var resName2 = "";
	var i = 0;
	for(var count = 0; count < obj.length; count++){
		if(obj[count].checked){
			if(resId2==""){
				resId2 = obj[count].resId2; 
			}else{
				resId2 += "^^" + obj[count].resId2;
			}
			if(resName2==""){
				resName2 = obj[count].resName2;
			}else{
				resName2 += "^^" + obj[count].resName2;
			}
			i ++;
		}
	}
	if(i > 1){
		var url = '${pageContext.request.contextPath}/purviewmanager/resmanager/org_iframe.jsp?resId2='+resId2+'&resTypeId2=<%=restype%>&resName2='+resName2+"&isBatch=true&resTypeName=<%=restypeName%>&title="+resId2;
		$.dialog({close:refsh,title:'<pg:message code="sany.pdp.resourcemanage.confer.organization"/>',width:760,height:560, content:'url:'+url,lock: true});
	}else if(i == 0){
		$.dialog.alert("<pg:message code='sany.pdp.resourcemanage.choose.resource'/>!",function(){},null,"<pg:message code='sany.pdp.common.alert'/>");
		return false;
	}else{
		$.dialog.alert("<pg:message code='sany.pdp.choose.two.record'/>!",function(){},null,"<pg:message code='sany.pdp.common.alert'/>");
		return false;
	}
}

function opernDlg(title,url){
		$.dialog({close:refsh,title:title,width:760,height:560, content:'url:'+url,lock: true});
}


</SCRIPT>		
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<body>
			
				<form name="ResSearchList" method="post" >
				<div id="res_div_id">
				<input type="hidden" name="resTypeName" value="<%=restypeName%>"/>
				<input type="hidden" name="restypeId" value="<%=restype%>"/>
				<%
							if(restypeName!=null)
							{
								%>
				<%
				 				if (control.isAdmin())
				            	{
				            	%>
				<div class="title_box">
				<div class="rightbtn">
				<a href="#" class="bt_small" id="addButton" onclick="newRes();"><span><pg:message code="sany.pdp.common.add"/></span></a>
				<a href="#" class="bt_small" id="addButton" onclick="javascript:dealRecord(1); return false;"><span><pg:message code="sany.pdp.common.batch.delete"/></span></a>
				<a href="#" class="bt_small" id="addButton" onclick="resBatchUser();"><span><pg:message code="sany.pdp.resourcemanage.confer.user"/></span></a>
				<a href="#" class="bt_small" id="delBatchButton" onclick="resBatchRole();"><span><pg:message code="sany.pdp.resourcemanage.confer.role"/></span></a>
				<%
								if(isOrg){
								
				            	%>
				 <a href="#" class="bt_small" id="delBatchButton" onclick="resBatchOrg();"><span><pg:message code="sany.pdp.resourcemanage.confer.organization"/></span></a>
				 <%
								}
								%>
				            	
				</div>
				<strong><%=restypeName%></strong>
				</div>
				<%
								}
								%>
								 <%
								}
								%>
         			<pg:listdata dataInfo="ResSearchList" keyName="ResSearchList" />
						<!--分页显示开始,分页标签初始化-->
						<pg:pager maxPageItems="10" scope="request" data="ResSearchList" isList="false">
						<pg:equal actual="${ResSearchList.itemCount}" value="0" >
						<div class="nodata">
						<img src="${pageContext.request.contextPath}<pg:message code='sany.pdp.common.list.nodata.path'/>"/></div>
					</pg:equal> 
					<pg:notequal actual="${ResSearchList.itemCount}"  value="0">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="stable" id="tb">
							<pg:header>
								<!--设置分页表头-->
								<th>
									<input type="checkBox" name="checkBoxAll" onClick="checkAll('checkBoxAll','checkBoxOne')">
								</td>
								<input class="text" type="hidden" name="selectId">
								<th><pg:message code="sany.pdp.resourcemanage.resource.type"/></th>
								<th><pg:message code="sany.pdp.resourcemanage.resource.name"/></th>
								<th><pg:message code="sany.pdp.resourcemanage.resource.description"/></th>
								<th><pg:message code="sany.pdp.resourcemanage.confer.user"/></th>
								<th><pg:message code="sany.pdp.resourcemanage.confer.role"/></th>
								<% 
									if(isOrg){
								%>
								<th><pg:message code="sany.pdp.resourcemanage.confer.organization"/></th>
								<% 
									}
								%>
							</pg:header>
							<pg:param name="restypeId" />
							<pg:param name="title" />
							<pg:param name="path" />
							<pg:param name="restypeName" />
							

							<!--list标签循环输出每条记录-->
							<pg:list>
								<tr class="cms_data_tr" onMouseOver="high(this)" onMouseOut="unhigh(this)">
									<td class="tablecells" nowrap="nowrap" height='30'>
										<div align="center"><input type="checkBox" name="checkBoxOne" onClick="checkOne('checkBoxAll','checkBoxOne')" value="<pg:cell colName="resId" defaultValue=""/>" resId2='<pg:cell colName="title" defaultValue="" />' resName2='<pg:cell colName="title" defaultValue="" />' width="10">
										</div>
									</td>
									<td class="tablecells" nowrap="nowrap" height='30'>
										<pg:cell colName="restypeName" defaultValue="" />
									</td>
									
									<!-- 资源修改，只能是拥有超级管理员角色的用户能进行此项操作 --> 
									<td class="tablecells" nowrap="nowrap" height='30' style="cursor:hand" bgcolor="#F6FFEF"
										
										<%if(control.isAdmin()){ %>
										onclick="getRes('<pg:cell colName='resId' defaultValue=''/>','<pg:cell colName='restypeId' defaultValue=''/>')"
										<%} %>
									>
									<input type="hidden" name="title" value="<pg:cell colName="title" defaultValue="" />"/>
										<pg:cell colName="title" defaultValue="" />
									</td>
									<td class="tablecells" nowrap="nowrap" height='30'>
										<pg:cell colName="path" defaultValue=""  />
									</td>
									
									<td onclick="opernDlg('<pg:message code="sany.pdp.resourcemanage.confer.user"/>','${pageContext.request.contextPath}/purviewmanager/resmanager/user_iframe.jsp?resId2=<pg:cell colName="title" defaultValue=""/>&resTypeId2=<%=restype%>&title=<pg:cell colName="title" defaultValue=""/>&resName2=<pg:cell colName="title" defaultValue=""/>&isBatch=false',screen.availWidth-100,screen.availHeight-50)">
									<div align="center"><IMG src="../images/new_doc.gif" border="0"  style="cursor:hand"></div>
									</td>
									
									
									<td onclick="opernDlg('<pg:message code="sany.pdp.resourcemanage.confer.role"/>','${pageContext.request.contextPath}/purviewmanager/resmanager/role_iframe.jsp?resId2=<pg:cell colName="title" defaultValue=""/>&resTypeId2=<%=restype%>&title=<pg:cell colName="title" defaultValue=""/>&resName2=<pg:cell colName="title" defaultValue=""/>&isBatch=false',screen.availWidth-100,screen.availHeight-50)">
									<div align="center"><IMG src="../images/new_doc.gif" border="0"  style="cursor:hand"></div>
									</td>
									
									<%
									if(isOrg){
				 					
				            		%>
									<td onclick="opernDlg('<pg:message code="sany.pdp.resourcemanage.confer.organization"/>','${pageContext.request.contextPath}/purviewmanager/resmanager/org_iframe.jsp?resId2=<pg:cell colName="title" defaultValue=""/>&resTypeId2=<%=restype%>&title=<pg:cell colName="title" defaultValue=""/>&resName2=<pg:cell colName="title" defaultValue=""/>&isBatch=false',screen.availWidth-100,screen.availHeight-50)">
									<div align="center"><IMG src="../images/new_doc.gif" border="0"  style="cursor:hand"></div>
									</td>
									<%
									}
									%>
									
								</tr>
							</pg:list>
						</tr>
							

				  </table>
				  <div class="pages"><input type="hidden" value="<pg:querystring/>" id="querystring"/><pg:index tagnumber="5" sizescope="5,10,20,50,100"/></div>
						</pg:notequal>
						</pg:pager>
				  </div>
				</form>
				<div style="display:none">
		<iframe name="delRes" width="0" height="0" ></iframe>
				</div>
</body>
<center>
</html>

