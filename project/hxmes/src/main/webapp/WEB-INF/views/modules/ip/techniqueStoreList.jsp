<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>存储白名单管理</title>
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
		window.location.href = "${ctx}/ip/techniqueStore/form?id="
				+ rusult;
		//window.location.href="/hxmes/ip/organization/form?id="+rusult；
		//alert("edit"+rusult);
	}
	/* function edit_click() {
		var rusult = 0;
		var number = 0;
		var errorinformation = document.getElementById("errorinformation");
		var check_array = document.getElementsByName("Select");
		for (var i = 0; i < check_array.length; i++) {
			if (check_array[i].checked == true) {
				rusult = check_array[i].value;
				number++;
			}
		}
		if (number == 0) {
			errorinformation.innerHTML = "您尚未选择！";
			return;
		} else if (number > 1) {
			errorinformation.innerHTML = "您只能修改一条信息！";
			return;
		} else {
			errorinformation.innerHTML = "";
		}
		window.location.href = "${ctx}/ip/techniqueStore/form?id=" + rusult;
		//window.location.href="/hxmes/ip/organization/form?id="+rusult；
		//alert("edit"+rusult);
	} */
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
			var herfss = "${ctx}/ip/techniqueStore/deletes?id="
					+ herfs.toString();
			confirmx('确认要删除这些白名单信息吗？', herfss);
		} else {
			var herf = "${ctx}/ip/techniqueStore/delete?id=" + rusult;
			confirmx('确认要删除该行白名单信息吗？', herf);
		}
	}
	window.onload = function() {
		var sequencer = document.getElementsByClassName("Sequence");
		for (var i = 0; i < sequencer.length; i++) {
			sequencer[i].innerHTML = i + 1;
		}
	}
</script>
</head>
<body>
<ul class="nav nav-tabs">
		<li class="active">
			<a href="${ctx}/ip/technique/">储存白名单</a>
		</li>
		<li class="pull-right">
			<input id="btnAdd" class="btn btn-primary " type="button" value="新增" onclick="window.location.href='${ctx}/ip/technique/form'" />
		</li>
	</ul>
	<table>
	<form:form id="searchForm" modelAttribute="techniqueStore"
		action="${ctx}/ip/techniqueStore/" method="post"
		class="breadcrumb form-search">
		<tr>
		<td>
		<shiro:hasPermission name="ip:techniqueStore:edit">
			<input id="btnAdd" class="btn btn-primary" type="button" value="新增"
				onclick="window.location.href='${ctx}/ip/techniqueStore/form'" />
		</shiro:hasPermission>
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}" />
		<input id="pageSize" name="pageSize" type="hidden"
			value="${page.pageSize}" />&nbsp;
		</td>
		<td>
		<label>工艺路线 ：</label>
		<tags:treeselect id="gylx_id" name="gylx_id" value="${list.id}"
			labelName="name" labelValue="${list.name}" title="工艺路线名称:"
			url="/ip/workCenter/treeData" />&nbsp;
		</td>
		<td>
		<label>工作中心 ：</label>
		<tags:treeselect id="gzzx_id" name="gzzx_id" value="${list.id}"
			labelName="name" labelValue="${list.name}" title="工作中心名称:"
			url="/ip/workCenter/treeData" />&nbsp;
		</td>
		<td>
		<label>物料 ：</label>
			<tags:treeselect id="" name="" value="${list.id}"
				labelName="name" labelValue="${list.name}" title="物料:"
				url="/ip/workCenter/treeData" />
		</td>
		</tr>
		<tr>
		<td></td>
		<td>
		<label>节点类型 ：</label>
		<form:select path="">
			<option>全部</option>
			<option>工艺路线</option>
			<option>工序组</option>
			<option>工序</option>
		</form:select>
		</td>
		<td>
		<label>默认工作中心 ：</label>
		<form:select class="input-small" path="">
			<form:options items="${fns:getDictList('yes_no')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
		</form:select>
		</td>
		<td>
		<label>是否启用 ：</label>
		<form:select class="input-small" path="sfqy">
			<form:options items="${fns:getDictList('shi_yong')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
		</form:select>
		</td>
		<td>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit"
			value="查询" />
		</td>
		</tr>
	</form:form>
	</table>
	<br>
	<tags:message content="${message}" />
	<table id="contentTable"
		class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th><input name="check" type="checkbox" id="SelectAll"
					onclick="CheckSelect()" />全选</th>
				<th>序号</th>
				<th>工艺路线编码</th>
				<th>工艺路线</th>
				<th>节点类型</th>
				<th>工作中心编码</th>
				<th>工作中心名称</th>
				<th>默认工作中心</th>
				<th>物料</th>
				<th>仓库</th>
				<th>是否启用</th>
				<shiro:hasPermission name="ip:techniqueStore:edit"></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${page.list}" var="techniqueStore">
				<tr>
					<td><input type="checkbox" value="${techniqueStore.id}"
						name="Select" class="Select" /></td>
					<td class="Sequence"></td>


					<td>Workcentergylx_id</td>
					<td>？工艺路线？？</td>
					<td>？节点类型？？</td>
					<td>{techniqueStore.gygzzx_id}</td>
					<td><a
						href="${ctx}/ip/techniqueStore/form?id=${techniqueStore.id}">？工作中心名称？？</a></td>
					<td>sfmrgzzx</td>


					<td>${techniqueStore.wl_id}</td>
					<td>${techniqueStore.ccck_id}</td>
					<td>${techniqueStore.bz}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<input id="btnQuery" class="btn btn-primary" type="button" value="编辑" onclick="edit_click()" />&nbsp;
		<input id="btnDelete" class="btn btn-primary" type="button" value="删除" onclick="del_click()" />&nbsp;
		<input id="btnExport" class="btn btn-primary" type="button" value="导出" onclick="exp_click()" />&nbsp;
	<div class="pagination">${page}</div>
</body>
</html>
