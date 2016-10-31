<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>政治面貌经历管理</title>
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
	function CheckSelect() {
		var all = document.getElementById("SelectAll");
		var checkbox = document.getElementsByName("Select");
		for (var i = 0; i < checkbox.length; i++) {
			if (all.checked == true) {
				checkbox[i].checked = true;
			} else {
				checkbox[i].checked = false;
			}
		}
	}
	function edit_click() {
		var rusult = 0;
		var number = 0;
		var check_array = document.getElementsByName("Select");
		for (var i = 0; i < check_array.length; i++) {
			if (check_array[i].checked == true) {
				rusult = check_array[i].value;
				number++;
			}
		}
		if (number == 0) {
			alert("请选中一条需要修改的信息");
			return;
		} else if (number > 1) {
			alert("一次只能修改一条信息");
			return;
		}
		window.location.href = "${ctx}/ip/employeePoliticalStatus/form?id="
				+ rusult;
		//window.location.href="/hxmes/ip/organization/form?id="+rusult；
		//alert("edit"+rusult);
	}

	function del_click() {
		var rusult = 0;
		var number = 0;
		var check_array = document.getElementsByName("Select");
		for (var i = 0; i < check_array.length; i++) {
			if (check_array[i].checked == true) {
				rusult = check_array[i].value;
				number++;
			}
		}
		if (number == 0) {
			alert("请选中一条需要删除的信息");
			return;
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
			var herfss = "${ctx}/ip/employeePoliticalStatus/deletes?id="
					+ herfs.toString();
			confirmx('确认要删除这些政治面貌经历信息吗？', herfss);
		} else {
			var herf = "${ctx}/ip/employeePoliticalStatus/delete?id=" + rusult;
			confirmx('确认要删除该政治面貌经历信息吗？', herf);
		}
	}
	window.onload = function() {
		var xl = document.getElementsByClassName("xl");
		for (i = 0; i < xl.length; i++) {
			xl[i].innerHTML = i + 1;
		}
	}
</script>
</head>
<body><ul class="nav nav-tabs">
			<li class="active">
				<a href="#">职工政治面貌经历</a>
			</li>
			<li class="pull-right">
				<input id="btnAdd" class="btn btn-primary " type="button" value="新增" onclick="window.location.href='${ctx}/ip/employeePoliticalStatus/form'" />
			</li>
		</ul>
	<form:form id="searchForm" modelAttribute="employeePoliticalStatus"
		action="${ctx}/ip/employeePoliticalStatus/list" method="post"
		class="breadcrumb form-search">
		
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<label>姓名 ：</label>
		<tags:treeselect id="zg_id" name="employee.id" value="${list.id}" labelName="name" labelValue="${list.name}" title="员工" url="/ip/employee/treeData" />
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit"
			value="查询" />
	</form:form>
	<tags:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th><input name="check" type="checkbox" id="SelectAll"
					onclick="CheckSelect()" />全选</th>
				<th>序列</th>
				<th>姓名</th>
				<th>政治面貌</th>
				<th>参加组织时间</th>
				<th>审核状态</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="employeePoliticalStatus">
				<tr>
					<td><input type="checkbox"
						value="${employeePoliticalStatus.id}" name="Select" class="Select" /></td>
					<td>${employeePoliticalStatus.xl}</td>
					<td><a href="${ctx}/ip/employeePoliticalStatus/form?id=${employeePoliticalStatus.id}">${employeePoliticalStatus.employee.xm}</a></td>
					<td>${employeePoliticalStatus.zzmm}</td>
					<td><fmt:formatDate value="${employeePoliticalStatus.jrsj}"
							pattern='yyyy-MM-dd'></fmt:formatDate></td>
					<td>审核状态</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<input id="btnQuery" class="btn btn-primary" type="button" value="修改" onclick="edit_click()" />&nbsp;
	<input id="btnDelete" class="btn btn-primary" type="button" value="删除" onclick="del_click()" />&nbsp;
	<i id="errorinformation"></i>
	<div class="pagination">${page}</div>
</body>
</html>
