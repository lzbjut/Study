<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>岗位信息管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
		function edit_click() {
			var rusult = 0;
			var check_array = document.getElementsByName("check");
			for (var i = 0; i < check_array.length; i++) {
				if (check_array[i].checked == true) {
					rusult = check_array[i].value;
				}
			}
			window.location.href = "${ctx}/ip/organizationPosition/form?id=" + rusult;
			//window.location.href="/hxmes/ip/organization/form?id="+rusult；
			//alert("edit"+rusult);
		}

		function del_click() {
			var rusult = 0;
			var check_array = document.getElementsByName("check");
			for (var i = 0; i < check_array.length; i++) {
				if (check_array[i].checked == true) {
					rusult = check_array[i].value;
				}
			}
			var herf = "${ctx}/ip/organizationPosition/delete?id=" + rusult;
			confirmx('此岗位已被人员关联，是否确定删除？', herf);
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/ip/organizationPosition/">维护岗位信息</a></li>
		<li class="pull-right">
			<input id="btnAdd" class="btn btn-primary" type="button" value="添加岗位信息" onclick="window.location.href='${ctx}/ip/organizationPosition/form'"/>
		</li>
	</ul>
	
	<form:form id="searchForm" modelAttribute="organizationPosition" action="${ctx}/ip/organizationPosition/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>人员业务分类:</label>
			<form:select path="organizationposintionrank.id" class="input-large">
					<option value="">--请选择--</option>
					<c:forEach var="PRlist" items="${PRlist}" varStatus="s">
                    	<option value="${PRlist.id}" >${PRlist.RYYWLBMC}</option>
                    </c:forEach>
			</form:select>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<tags:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr>
		<th>全选</th>
		<th>序号</th>
		<th>岗位</th>
		<th>机构人员业务分类</th>
		<th>是否启用</th>
		
		<tbody>
		<c:forEach items="${page.list}" var="organizationPosition">
			<tr>
				<td><input type="checkbox" value="${organizationPosition.id}" name="check" /></td>
				<td>${organizationPosition.xssx}</td>
				<td>${organizationPosition.gwmc}</td>
				<td><a href="${ctx}/ip/organizationPosition/form?id=${organizationPosition.id}">${organizationPosition.organizationposintionrank.RYYWLBMC}</a></td>
				<td>${fns:getDictLabel(organizationPosition.sfqy, 'yes_no', '无')}</td>
				
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<input id="btnQuery" class="btn btn-primary" type="button" value="修改" onclick="edit_click()" />&nbsp;
	<input id="btnDelete" class="btn btn-primary" type="button" value="删除" onclick="del_click()" />
	<div class="pagination">${page}</div>
</body>
</html>
