<%@ include file="../include/global1.jsp"%>
<%@ include file="../base/scripts/panes.jsp"%>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles"%>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-template.tld" prefix="template"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/dictionary.tld" prefix="dict"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/WEB-INF/pager-taglib.tld" prefix="pg"%>
<%@page import="com.frameworkset.platform.security.AccessControl"%>
<%@page import="com.frameworkset.util.StringUtil"%>
<%@page import="java.util.*,com.frameworkset.platform.sysmgrcore.entity.*,com.frameworkset.platform.sysmgrcore.web.struts.form.*"%>
<%AccessControl accesscontroler = AccessControl.getInstance();
            accesscontroler.checkAccess(request, response);
            String userId = accesscontroler.getUserID();
            Date date = new Date();
            String dateStr = StringUtil.getFormatDate(date,
                    "yyyy-MM-dd HH:mm:ss");
            String curDate = request.getParameter("date");
            String curDate1 = request.getParameter("date1");
            String weekday = request.getParameter("weekday");
            String beginTime = request.getParameter("beginTime");
            String endTime = request.getParameter("endTime");
            String id = request.getParameter("id");
            if (curDate == null)
                curDate = "";
            if (beginTime == null)
                beginTime = "";
            if (endTime == null)
                endTime = "";
            beginTime = curDate + " " + beginTime;
            endTime = curDate + " " + endTime;
%>
<html>
	<head>
		<script language="JavaScript" src="common.js" type="text/javascript"></script>
		<script language="javascript" src="../scripts/selectTime.js"></script>
		<SCRIPT language="JavaScript" SRC="validateForm.js"></SCRIPT>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>添加日程</title>
		<%@ include file="/include/css.jsp"%>
		<link rel="stylesheet" type="text/css" href="../css/contentpage.css">
		<link rel="stylesheet" type="text/css" href="../css/tab.winclassic.css">
		<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.style2 {
	font-family: Tahoma, Verdana, Arial, Helvetica;
	font-weight: bold;
	font-size: medium;
}
.style3 {font-size: medium}
-->
        </style>
	</head>

	<script language="JavaScript">
	function submitSD(){     
		check('checkBox','isSys');
    	check('checkBox','isEmail');
    	check('checkBox','isMessage');
		if (document.all.item("remindBeginTime").value != "")
		{
		    if("<%=dateStr%>">document.all.item("remindBeginTime").value  )
			{
				alert("提醒开始时间早于当前时间");
	    		return;
	    	}
	    	if (document.all.item("remindEndTime").value == "")
			{
				alert("请填写提醒结束时间");
	    		return;
			}
			if(document.all.item("isSys").value == 0&&document.all.item("isEmail").value == 0&&document.all.item("isMessage").value == 0)
			{
				alert("请选择提醒方式");
	    		return;
			}
	    }
	    
	    if (document.all.item("remindEndTime").value != "")
		{
			if (document.all.item("remindBeginTime").value == "")
			{
				alert("请填写提醒开始时间");
	    		return;
			}
			
		}
	    
    	if(document.all.item("topic").value == "" )
		{
			alert("请填写主题!!!");
			return;
		}
		if(document.all.item("beginTime").value == " " )
		{
			alert("请选择开始时间!!!");
			return;
		}
		if(document.all.item("endTime").value == " " )
		{
			alert("请选择结束时间!!!");
			return;
		}
		
		if(document.all.item("beginTime").value > document.all.item("endTime").value)
		{
			alert("开始时间晚于结束时间");
    		return;
    	}
    	if(document.all.item("beginTime").value < "<%=dateStr%>")
		{
			alert("开始时间早于当前时间");
    		return;
    	}
    	if(document.all.item("remindBeginTime").value > document.all.item("remindEndTime").value)
		{
			alert("提醒开始时间晚于提醒结束时间");
    		return;
    	}
    	if(document.all.item("remindBeginTime").value > document.all.item("beginTime").value)
		{
			alert("提醒开始时间晚于日程开始时间");
    		return;
    	}
    	if(document.all.item("remindEndTime").value > document.all.item("endTime").value)
		{
			alert("提醒结束时间晚于日程结束时间");
    		return;
    	}
    	var curDate = "<%=curDate%>";
    	if(curDate=="")
    	{
    		document.forms[0].action="../schedularmanage/schManager.do?method=addSchedularAndRemind";
			document.forms[0].submit();	
    	}
	    else
	    {
	    	document.forms[0].action="../schedularmanage/schManager.do?method=addSchedular1&direct=all&curDate=<%=curDate%>&date1=<%=curDate1%>&weekday=<%=weekday%>";
			document.forms[0].submit();	
		}
	}	
	
	function impactCheck(){
		if(document.all.item("beginTime").value == " " )
		{
			alert("请选择开始时间!!!");
			return;
		}
		if(document.all.item("endTime").value == " " )
		{
			alert("请选择结束时间!!!");
			return;
		}
		
		if(document.all.item("beginTime").value >= document.all.item("endTime").value)
		{
			alert("开始时间大于结束时间");
    		return;
    	}
    	if(document.all.item("beginTime").value <= "<%=dateStr%>")
		{
			alert("开始时间小于当前时间");
    		return;
    	}
		var beginTime =document.all.item("beginTime").value;
		var endTime =document.all.item("endTime").value;
  		var linkurl = "impactSchedular.jsp" ;  	
  		document.resource_bridge.location = linkurl + "?beginTime=" + beginTime + "&endTime=" + endTime;
	}
	function addRemind(){
		if(document.all.item("remindTime").value == "" )
		{
			alert("请填写提醒时间!!!");
			return;
		}
		var remindBeginTime =document.all.item("remindTime").value;
		var remindEndTime =document.all.item("beginTime").value;
  		var linkurl = "remindList.jsp" ;  	
  		document.resource_bridge.location = linkurl + "?remindBeginTime=" + remindBeginTime + "&remindEndTime=" + remindEndTime;
	}
	
	function check(totalCheck,checkName){
	
		var o = document.all.item(checkName);
		if(o.checked)
		{
			o.value = 1;
		}
		else
		{
			o.value = 0;
		}
	}
	function adduser(){
	    	window.open('<%=rootpath%>/sysmanager/schedularmanage/selectexecutor.jsp?displayNameInput=partner&displayValueInput=executors','newWin','scrollbars=no,status=no,titlebar=no,toolbar=no,z-lock=yes,width=616,height=500,top=150,left=250')
		}

</script>

	<body class="info" scrolling="no">

		<form name="SchedularForm" action="" method="post">
			<pg:beaninfo requestKey="newSchedular">
				<div align="center" class="detailtitle style3">
					<p class="style4">
						<br>
						<span class="style2">个人日程安排</span>
						<br>
						<br>
					</p>
				</div>
				<input type="hidden" name="schedularID" value="<pg:cell colName="schedularID"  defaultValue=""/>" />
				<input type="hidden" name="plannerID" value="<pg:cell colName="plannerID"  defaultValue="<%=userId%>"/>" />
				<input type="hidden" name="executorID" value="<pg:cell colName="executorID"  defaultValue="<%=userId%>"/>" />
				<input type="hidden" name="requestID" value="<pg:cell colName="requestID"  defaultValue="0"/>" />
				<input type="hidden" name="type" value="<pg:cell colName="type"  defaultValue="自己安排"/>" />
				<input type="hidden" name="status" value="<pg:cell colName="status"  defaultValue="0"/>" />
				<input type="hidden" name="isHistory" value="<pg:cell colName="isHistory"  defaultValue="0"/>" />
				<input type="hidden" name="data1" value="<pg:cell colName="data1"  defaultValue="<%=curDate1%>"/>" />
				<input type="hidden" name="weekday" value="<pg:cell colName="weekday"  defaultValue="<%=weekday%>"/>" />
				<table width="100%"  border="0" cellpadding="0" cellspacing="2" class="thin">
					
					<tr>
						<td height="23" class="detailtitle" width="20%">
							<strong> 主题</strong>
						</td>
						<td>
							<input name="topic" type="text" value="<pg:cell colName="topic"  defaultValue=""/>">

						</td>
						<td height="23" class="detailtitle" width="20%">
							<strong> 地点</strong>
						</td>
						<td height="23" width="29%">
							<input name="place" type="text" value="<pg:cell colName="place"  defaultValue=""/>">
						</td>
					</tr>
					<tr>
						<td height="23" class="detailtitle">
							<strong> 开始时间</strong>
						</td>
						<td height="23" width="30%">
						
							<input name="beginTime" type="text" readonly="true" value="<pg:cell colName="beginTime"  defaultValue="<%=beginTime%>"/>">
							<INPUT type="button" class="input" value="时间" onclick="selectTime('SchedularForm.beginTime',0)">
						</td>
						<td height="23" class="detailtitle">
							<strong> 结束时间</strong>
						</td>
						<td height="23" width="30%">
							<input name="endTime" type="text" readonly="true" value="<pg:cell colName="endTime"  defaultValue="<%=endTime%>"/>">
							<INPUT type="button" class="input" value="时间" onclick="selectTime('SchedularForm.endTime',0)">
						</td>
						
					</tr>
					<tr>

						<td height="24" class="detailtitle">
							<strong> 重要性</strong>
						</td>
						<td height="24" width="30%">

							<select name="essentiality" class="select">
								<option value="0">
									<pg:equal colName="essentiality" value="0">selected</pg:equal>
									重要
								</option>
								<option value="1">
									<pg:equal colName="essentiality" value="1">selected</pg:equal>
									一般
								</option>
								<option value="2">
									<pg:equal colName="essentiality" value="2">selected</pg:equal>
									不重要
								</option>
							</select>
						</td>

						<td height="24" class="detailtitle">
							<strong> 是否空闲</strong>
						</td>
						<td height="24" width="30%">

							<SELECT name="isLeisure" class="select">
								<OPTION value="0" selected="true">
									<pg:equal colName="isLeisure" value="0">selected</pg:equal>
									忙
								</OPTION>
								<OPTION value="1">
									<pg:equal colName="isLeisure" value="1">selected</pg:equal>
									空闲
								</OPTION>
							</SELECT>

						</td>
					</tr>
					<tr>
						<td height="24" class="detailtitle">
							<strong> 是否公事</strong>
						</td>
						<td height="24" width="30%">
							<select name="isPublicAffair" class="select">
								<option value="0">
									<pg:equal colName="isPublicAffair" value="0">selected</pg:equal>
									公事
								</option>
								<option value="1">
									<pg:equal colName="isPublicAffair" value="1">selected</pg:equal>
									私事
								</option>
							</select>
						</td>
						<td height="24" class="detailtitle">
							<strong> 部门公开</strong>
						</td>
						<td height="24" width="30%">
							<select name="isOpen" class="select">
								<option value="1">
									<pg:equal colName="isOpen" value="1">selected</pg:equal>
									公开
								</option>
								<option value="0">
									<pg:equal colName="isOpen" value="0">selected</pg:equal>
									保密
								</option>
							</select>
						</td>
					</tr>

					<tr>

						<td height="23" class="detailtitle" width="20%">
							<strong> 开始提醒时间</strong>
						</td>
						<td width="20%">
							<input name="remindBeginTime" dateformat="yyyy-MM-dd HH:mm:ss" type="text" value="<pg:cell colName="remindBeginTime" dateformat="yyyy-MM-dd HH:mm:ss" defaultValue=""/>" readonly="true">
							<INPUT type="button" class="input" value="时间" onclick="selectTime('SchedularForm.remindBeginTime',0)">
						</td>
						<td height="23" class="detailtitle" width="20%">
							<strong> 结束提醒时间</strong>
						</td>
						<td width="20%">
							<input name="remindEndTime" dateformat="yyyy-MM-dd HH:mm:ss" type="text" value="<pg:cell colName="remindEndTime"  defaultValue=""/>" readonly="true">
							<INPUT type="button" class="input" value="时间" onclick="selectTime('SchedularForm.remindEndTime',0)">
						</td>
					</tr>
					<tr>
						<td height="23" class="detailtitle" width="10%">
							<strong> 提醒间隔</strong>
						</td>
						<td>
							<input name="interval" type="text" value="<pg:cell colName="interval"  defaultValue="30.0"/>">
							<select name="intervalType" class="select">
								<option value="0" <pg:equal colName="intervalType" value="0">selected</pg:equal>>
									分
								</option>
								<option value="1" <pg:equal colName="intervalType" value="1">selected</pg:equal>>
									小时
								</option>
								<option value="2" <pg:equal colName="intervalType" value="2">selected</pg:equal>>
									天
								</option>
							</select>
					
						<td height="23" width="13%" class="detailtitle">
							<strong> 提醒方式</strong>
						</td>
						<td height="23" width="30%">
							<input type="checkBox" name="isSys" onClick="check('checkBox','isSys')">
							<strong> 系统</strong>
							<input type="checkBox" name="isEmail" onClick="check('checkBox','isEmail')">
							<strong> 邮件</strong>
							<input type="checkBox" name="isMessage" onClick="check('checkBox','isMessage')">
							<strong> 短信</strong>
						
					</tr>
				
					<tr>
						<td height="23" width="20%" class="detailtitle">
							<strong>日程描述</strong>
						</td>
						<td height="23" width="30%">
							<textarea name="content" cols="25" rows="6"></textarea>

						</td>
						<td height="23" width="20%" class="detailtitle">
							<strong> 预约人</strong>
						</td>

						<td height="23" width="30%">
							<input name="executors" type="hidden" value="<pg:cell colName="executors"  defaultValue=""/>">
							<textarea name="partner" cols="25" rows="4" value="<pg:cell colName="partner"  defaultValue=""/>" readonly="true"></textarea>
							<INPUT type="button" class="input" value="选预约人" onclick="adduser()">
						</td>
						
					</tr>
				</table>


			</pg:beaninfo>
			<hr width="98%">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<INPUT type="button" class="input" value="检测冲突" onclick="impactCheck()">
					<INPUT type="button" class="input" value="提交" onclick="submitSD()">
				</tr>
				<tr>
			</table>
		</form>
		<table height="40%" width="100%">
			<tr height="10%" width="100%">
				<td width="100%"></td>
			</tr>
			<tr height="100%" width="100%">
				<td height="100%" width="100%">
					<iframe id="resource_bridge" FRAMEBORDER="0" name="resource_bridge" src="" height="100%" width="100%" />
				</td>
			</tr>
		<%@include file="../sysMsg.jsp" %>
		</table>
	</body>
</html>


