<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>副产品信息管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate();
		});
	</script>
</head>
<body>
	<br/>
	<form:form id="inputForm" modelAttribute="techniqueOutput" action="${ctx}/ip/techniqueOutput/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<tags:message content="${message}"/>
		<table>
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label" for="">工艺路线:</label>
					<div class="controls">
						<tags:treeselect id="" name="" value="${list.id}" labelName="name"
							labelValue="${list.name}" title="工艺路线："
							url="" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label" for="">工艺路线编码:</label>
					<div class="controls">
						<tags:treeselect id="" name="" value="${list.id}" labelName="name"
							labelValue="${list.name}" title="工艺路线编码："
							url="" />
					</div>
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label" for="">工艺中心名称:</label>
					<div class="controls">
						<tags:treeselect id="" name="" value="${list.id}" labelName="name"
							labelValue="${list.name}" title="工艺中心名称："
							url="" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label" for="">工艺中心编码:</label>
					<div class="controls">
						<tags:treeselect id="" name="" value="${list.id}" labelName="name"
							labelValue="${list.name}" title="工艺中心编码："
							url="" />
					</div>
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label" for="">是否默认工作中心:</label>
					<div class="controls">
						<tags:treeselect id="" name="" value="${list.id}" labelName="name"
							labelValue="${list.name}" title="是否默认工作中心："
							url="" />
					</div>
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label" for="wl">物料:</label>
					<div class="controls">
						<tags:treeselect id="wl" name="wl"
							value="${list.id}" labelName="name" labelValue="${list.name}"
							title="物料：" url="/ip/material/treeData" />
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label" for="wl_id">物料编码:</label>
					<div class="controls">
						<tags:treeselect id="ip_wlbm_id" name="wl_id"
							value="${list.id}" labelName="name" labelValue="${list.name}"
							title="物料编码：" url="/ip/material/treeData" />
					</div>
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label" for="jldw_id">计量单位:</label>
					<div class="controls">
					<form:select path="jldw_id">
						<form:options items="${fns:getDictList('d_jldw')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
					</form:select>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label" for="sl">数量:</label>
					<div class="controls">
						<form:input path="sl" htmlEscape="false" class="input-xlarge"/>
					</div>
				</div>
			</td>
		</tr>
	
		<tr>	
			<td>
				<div class="control-group">
					<label class="control-label" for="fcplb">副产品类别:</label>
					<div class="controls">
					<form:select path="fcplb">
						<form:options items="${fns:getDictList('d_fcplb')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
					</form:select>
					</div>
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label" for="sfqy">是否启用:</label>
					<div class="controls">
					<form:select path="sfqy">
						<form:options items="${fns:getDictList('yes_no')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
					</form:select>
					</div>
				</div>
			</td>
			<td>
				<div class="control-group">
					<label class="control-label" for="xssx">显示顺序:</label>
					<div class="controls">
						<form:input path="xssx" htmlEscape="false" maxlength="200"
							class="required" />
					</div>
				</div>
			</td>
		</tr>
		
		<tr>
			<td>
				<div class="control-group">
					<label class="control-label" for="bz">备注:</label>
					<div class="controls">
						<form:textarea path="bz" htmlEscape="false" rows="1" maxlength="200" class="input-xxlarge"/>
					</div>
				</div>
			</td>
		</tr>
		</table>
		<div class="form-actions">
			<shiro:hasPermission name="ip:techniqueOutput:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
