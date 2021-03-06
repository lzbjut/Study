<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>规程要求管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate();
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active">
			<a href="${ctx}/ip/techniqueOpsStep/form?id=${techniqueOpsStep.id}">新增工序操作规程 </a>
		</li>
		<li class="pull-right">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存" onclick="$('#inputForm').submit();" />
				<input type='button' class="btn btn-primary" value='重置' onClick="$('#inputForm')[0].reset();">
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)" />		
		</li>
	</ul>	
	<form:form id="inputForm" modelAttribute="techniqueOpsStep" action="${ctx}/ip/techniqueOpsStep/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<tags:message content="${message}"/>
		<div class="control-group">
			<label class="control-label" for="gcmc">工序操作规程:</label>
			<div class="controls">
				<form:input path="gcmc" htmlEscape="false" maxlength="200" class="input-large required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="gylx_id">工序:</label>
			<div class="controls ">
				<tags:treeselect id="gylx_id" name="technique.id" value="${list.id}" labelName="technique.mc"
					labelValue="${list.name}" title="工序名称" url="/ip/technique/treeData" cssClass="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="gclb">操作规程类别:</label>
			<div class="controls">
				<form:select path="gclb" class="required">
					<form:option value="" label="请选择" />
					<form:options items="${fns:getDictList('technique_CType')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="gcms">操作规程描述:</label>
			<div class="controls">
				<form:textarea path="gcms" htmlEscape="false" rows="1" maxlength="200" class="input-large required" style="margin: 0px; height: 242px; width: 359px;"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="sfqy">是否启用:</label>
			<div class="controls">
				<form:select path="sfqy" name="sfqy" class="required">
					<form:options items="${fns:getDictList('yes_no')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
		</div>
		
		<%-- <div class="control-group">
			<label class="control-label" for="sfqy">是否启用:</label>
			<div class="controls">
				<form:select path="sfqy" class="required">
					<form:option value="" label="请选择" />
					<form:options items="${fns:getDictList('yes_no')}"
						itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label" for="xssx">显示顺序:</label>
			<div class="controls">
				<form:input path="xssx" htmlEscape="false" rows="1" maxlength="200" class="input-large required"/>
				
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="bz">备注:</label>
			<div class="controls">
				<form:textarea path="bz" htmlEscape="false" rows="1" maxlength="200" class="input-large" style="margin: 0px; height: 242px; width: 359px;"/>
			</div>
		</div>

	</form:form>
</body>
</html>
