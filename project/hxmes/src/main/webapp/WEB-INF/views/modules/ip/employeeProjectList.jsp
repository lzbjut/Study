<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>科研项目记录管理</title>
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
	function edit_click() {
		var result = 0;
		var num = 0;
		var check_array = document.getElementsByName("Select");
		for (var i = 0; i < check_array.length; i++) {
			if (check_array[i].checked == true) {
				result = check_array[i].id;
				num++;
			}
		}
		if (num == 0) {
			alert("请选中一条需要修改的信息");
			return;
		}
		if (num > 1) {
			alert("一次只能修改一条信息");
			return;
		}
		window.location.href = "${ctx}/ip/employeeProject/form?id=" + result;
		//window.location.href="/hxmes/ip/organization/form?id="+rusult；
		//alert("edit"+rusult);
	}

	function del_click() {
		var result = 0;
		var num = 0;
		var check_array = document.getElementsByName("Select");
		for (var i = 0; i < check_array.length; i++) {
			if (check_array[i].checked == true) {
				result = check_array[i].id;
				num++;
			}
		}
		if (num == 0) {
			alert("请选中一条需要删除的信息");
			reutrn;
		} else if (num > 1) {
			var idAll = new Array();
			var count = 0;
			var herfs = new Array();
			for (var i = 0; i < check_array.length; i++) {
				if (check_array[i].checked == true) {
					idAll[count] = check_array[i].id;
					count++;
				}
			}
			for (var j = 0; j < count; j++) {
				herfs[j] = idAll[j];
			}
			var herfss = "${ctx}/ip/employeeProject/deletes?id="
					+ herfs.toString();
			confirmx('确认要删除这些科研项目信息吗？', herfss);
		} else {
			var herf = "${ctx}/ip/employeeProject/delete?id=" + result;
			confirmx('确认要删除该科研项目信息吗？', herf);
		}
	}
	function CheckSelect() { // 遍历 form  
		var all = document.getElementById("SelectAll");
		var checkbox = document.getElementsByName("Select"); // 检查是否是指定的控件 
		for (var i = 0; i < checkbox.length; i++) { // 提取控件
			if (all.checked == true) {// 正选
				checkbox[i].checked = true;
			} else { // 反选 
				checkbox[i].checked = false;
			}
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
<body>
	<!--  <ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/ip/employeeProject/">科研项目记录列表</a></li>
		<shiro:hasPermission name="ip:employeeProject:edit">
			<li><a href="${ctx}/ip/employeeProject/form">科研项目记录添加</a></li>
		</shiro:hasPermission>
	</ul>-->
	<ul class="nav nav-tabs">
			<li class="active">
				<a href="#">职工科研项目管理</a>
			</li>
			<li class="pull-right">
				<input id="btnAdd" class="btn btn-primary " type="button" value="新增" onclick="window.location.href='${ctx}/ip/employeeProject/form'" />
			</li>
		</ul>
	<form:form id="searchForm" modelAttribute="employeeProject"
		action="${ctx}/ip/employeeProject/" method="post"
		class="breadcrumb form-search">
		
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />
		<label>科研项目名称 ：</label>
		<tags:treeselect id="zg_id" name="employee.id" value="${list.id}" labelName="employee.xm" labelValue="${list.name}"
					title="员工" url="/ip/employee/treeData"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit"
			value="查询" />
	</form:form>
	<tags:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th><input name="SelectAll" type="checkbox" id="SelectAll"
					onclick="CheckSelect()" />全选</th>
				<th>序列</th>
				<th>姓名</th>
				<th>科研项目名称</th>
				<th>科研项目级别</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>举办单位</th>
				<th>成果名称</th>
				<th>完成形式</th>
				<th>备注</th>
			</tr>
		</thead>
		<tbody id=1>
			<c:forEach items="${page.list}" var="employeeProject">
				<tr>
					<td align="center"><input name="Select" type="checkbox"
						class="Select" id="${employeeProject.id}" /></td>
					<td>${employeeProject.xl}</td>
					<td>${employeeProject.employee.xm}</td>
					<td>${employeeProject.kyxmmc}</td>
					<td>${fns:getDictLabel(employeeProject.kyxmjb, 'd_kyxmjb', '无')}</td>
					<td><fmt:formatDate value="${employeeProject.kssj}"
							pattern='yyyy-MM-dd'></fmt:formatDate></td>
					<td><fmt:formatDate value="${employeeProject.jssj}"
							pattern='yyyy-MM-dd'></fmt:formatDate></td>
					<td>${employeeProject.jbdw}</td>
					<td>${employeeProject.cgmc}</td>
					<td>${fns:getDictLabel(employeeProject.wcxs, 'd_wcxs', '无')}</td>
					<td></td>
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
