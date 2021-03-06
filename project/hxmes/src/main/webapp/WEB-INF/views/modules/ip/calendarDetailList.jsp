 <%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>工厂日历明细管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {

	});
	function page(n, s) {
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").submit();
		return false;
	}
	function checkAll() {
		var subBoxs = document.getElementsByClassName("subBoxs");
		for (var i = 0; i < subBoxs.length; ++i) {
			subBoxs[i].checked = true;
		}
	}
	function unCheckAll() {
		var subBoxs = document.getElementsByClassName("subBoxs");
		for (var i = 0; i < subBoxs.length; ++i) {
			subBoxs[i].checked = false;
		}
	}
	function setAll() {
		var all = document.getElementById("all");
		if (all.checked == true) {
			checkAll();
		} else {
			unCheckAll();
		}
	}
	function edit_click() {
		var result = 0;
		var number = 0;
		var check_array = document.getElementsByClassName("subBoxs");
		for (var i = 0; i < check_array.length; i++) {
			if (check_array[i].checked == true) {
				result = check_array[i].value;
				number++
			}
		}
		if (number == 0) {
			alert("请选中一条需要修改的信息");
			return false;
		} else if (number > 1) {
			alert("一次只能修改一条信息");
			return false;
		}
		window.location.href = "${ctx}/ip/calendarDetail/editform?id=" + result;
	}

	function del_click() {
		var result = 0;
		var number = 0;
		var check_array = document.getElementsByClassName("subBoxs");
		for (var i = 0; i < check_array.length; i++) {
			if (check_array[i].checked == true) {
				result = check_array[i].value;
				number++;
			}
		}
		if (number == 0) {
			alert("请选中一条需要删除的信息");
			return false;
		} else if (number > 1) {
			var idAll = new Array();
			var count = 0;
			var herfs = new Array();
			for (var i = 0; i < check_array.length; i++) {
				if (check_array[i].checked == true) {
					idAll[count] = check_array[i].value;
					count++;
				}
			}
			for (var j = 0; j < count; j++) {
				herfs[j] = idAll[j];
			}
			var herfss = "${ctx}/ip/calendarDetail/deletes?id="
					+ herfs.toString();
			confirmx('确认要删除这些工厂日历明细吗？', herfss);
		} else {
			var herf = "${ctx}/ip/calendarDetail/delete?id=" + result;
			confirmx('确认要删除该行工厂日历明细吗？', herf);
		}
	}
	function sfsb(){
		var target = document.getElementsByClassName("sfsb");
		for(var i =0;i<target.length;i++){
		if(target[i].innerHTML == 1){
			target[i].innerHTML="是";
		}
		else{
			target[i].innerHTML="否";
		}
		}
	}
	function gzrlx(){
		var target = document.getElementsByClassName("gzrlx");
		for(var i =0;i<target.length;i++){
		if(target[i].innerHTML == 0){
			target[i].innerHTML="工作日";
		}
		else if(target[i].innerHTML == 1){
			target[i].innerHTML="双休日";
		}
		else if(target[i].innerHTML == 2){
			target[i].innerHTML="节假日";
		}
		else{
			target[i].innerHTML="特殊节日";
		}
		}
	}
	window.onload = function() {
		sfsb();
		gzrlx();
		var xl = document.getElementsByClassName("xl");
		for (i = 0; i < xl.length; i++) {
			xl[i].innerHTML = i + 1;
		}
	}
</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="calendarDetail"
		action="${ctx}/ip/calendarDetail/" method="post"
		class="breadcrumb form-search">
		<shiro:hasPermission name="ip:calendarDetail:edit">
			<input id="btnAdd" class="btn btn-primary" type="button" value="新增"
				onclick="window.location.href='${ctx}/ip/calendarDetail/form'" />
		</shiro:hasPermission>
	    &nbsp;
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<input type="hidden" id="gcrlfa_id" name="gcrlfa_id" value="${calendarDetail.gcrlfa_id}" />
		<label>日期 ：</label>
		<input id="rq" name="rq" htmlEscape="false" maxlength="20"
					readonly="readonly" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit"
			value="查询" />
	</form:form>
	<tags:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th><input type="checkbox" id="all" onclick="setAll()" />全选</th>
				<th>日期</th>
				<th>工作日类型</th>
				<th>是否上班</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="calendarDetail">
				<tr>
					<td class="xl"></td>
					<td><input type="checkbox" value="${calendarDetail.id}"
						class="subBoxs" /></td>
					<td><fmt:formatDate value="${calendarDetail.rq}" pattern='yyyy-MM-dd'/></td>
					<td class="gzrlx">${calendarDetail.gzrlx}</td>
					<td class="sfsb">${calendarDetail.sfsb}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<input id="btnQuery" class="btn btn-primary" type="button" value="修改"
		onclick="edit_click()" />&nbsp;
	<input id="btnDelete" class="btn btn-primary" type="button" value="删除"
		onclick="del_click()" />
	<div class="pagination">${page}</div>
</body>
</html>
