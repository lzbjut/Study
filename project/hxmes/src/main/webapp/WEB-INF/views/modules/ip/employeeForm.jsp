<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>个人信息管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
	$(document).ready(function() {
		$("#name").focus();
		$("#inputForm").validate();
	});

	function displaytable(tablename) {
		var grxx_traget = document.getElementById("grxx");
		var lxfs_traget = document.getElementById("lxfs");
		var qs_traget = document.getElementById("qs");
		var grjj_traget = document.getElementById("grjj");
		var gzqk_traget = document.getElementById("gzqk");
		var xtsx_traget = document.getElementById("xtsx");

		var li_grxx_traget = document.getElementById("li_grxx");
		var li_lxfs_traget = document.getElementById("li_lxfs");
		var li_qs_traget = document.getElementById("li_qs");
		var li_grjj_traget = document.getElementById("li_grjj");
		var li_gzqk_traget = document.getElementById("li_gzqk");
		var li_xtsx_traget = document.getElementById("li_xtsx");

		if (tablename == "grxx") {
			grxx_traget.style.display = "";
			lxfs_traget.style.display = "none";
			qs_traget.style.display = "none";
			grjj_traget.style.display = "none";
			gzqk_traget.style.display = "none";
			xtsx_traget.style.display = "none";
			li_grxx_traget.className = "active";
			li_lxfs_traget.className = "";
			li_qs_traget.className = "";
			li_grjj_traget.className = "";
			li_gzqk_traget.className = "";
			li_xtsx_traget.className = "";
		} else if (tablename == "lxfs") {
			grxx_traget.style.display = "none";
			lxfs_traget.style.display = "";
			qs_traget.style.display = "none";
			grjj_traget.style.display = "none";
			gzqk_traget.style.display = "none";
			xtsx_traget.style.display = "none";
			li_grxx_traget.className = "";
			li_lxfs_traget.className = "active";
			li_qs_traget.className = "";
			li_grjj_traget.className = "";
			li_gzqk_traget.className = "";
			li_xtsx_traget.className = "";
		} else if (tablename == "qs") {
			grxx_traget.style.display = "none";
			lxfs_traget.style.display = "none";
			qs_traget.style.display = "";
			grjj_traget.style.display = "none";
			gzqk_traget.style.display = "none";
			xtsx_traget.style.display = "none";
			li_grxx_traget.className = "";
			li_lxfs_traget.className = "";
			li_qs_traget.className = "active";
			li_grjj_traget.className = "";
			li_gzqk_traget.className = "";
			li_xtsx_traget.className = "";
		} else if (tablename == "grjj") {
			grxx_traget.style.display = "none";
			lxfs_traget.style.display = "none";
			qs_traget.style.display = "none";
			grjj_traget.style.display = "";
			gzqk_traget.style.display = "none";
			xtsx_traget.style.display = "none";
			li_grxx_traget.className = "";
			li_lxfs_traget.className = "";
			li_qs_traget.className = "";
			li_grjj_traget.className = "active";
			li_gzqk_traget.className = "";
			li_xtsx_traget.className = "";
		} else if (tablename == "gzqk") {
			grxx_traget.style.display = "none";
			lxfs_traget.style.display = "none";
			qs_traget.style.display = "none";
			grjj_traget.style.display = "none";
			gzqk_traget.style.display = "";
			xtsx_traget.style.display = "none";
			li_grxx_traget.className = "";
			li_lxfs_traget.className = "";
			li_qs_traget.className = "";
			li_grjj_traget.className = "";
			li_gzqk_traget.className = "active";
			li_xtsx_traget.className = "";
		} else if (tablename == "xtsx") {
			grxx_traget.style.display = "none";
			lxfs_traget.style.display = "none";
			qs_traget.style.display = "none";
			grjj_traget.style.display = "none";
			gzqk_traget.style.display = "none";
			xtsx_traget.style.display = "";
			li_grxx_traget.className = "";
			li_lxfs_traget.className = "";
			li_qs_traget.className = "";
			li_grjj_traget.className = "";
			li_gzqk_traget.className = "";
			li_xtsx_traget.className = "active";
		}

	}
</script>
</head>
<body>
	<!-- 
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/ip/employee/">添加个人信息列表</a></li>
	</ul><br/>
	 -->
	<ul class="nav nav-tabs">
		<li id="li_grxx" class="active"><a onclick="displaytable('grxx')">个人信息</a></li>
		<li id="li_lxfs" class=""><a onclick="displaytable('lxfs')">联系方式</a></li>
		<li id="li_qs" class=""><a onclick="displaytable('qs')">亲属</a></li>
		<li id="li_grjj" class=""><a onclick="displaytable('grjj')">个人简介</a></li>
		<li id="li_gzqk" class=""><a onclick="displaytable('gzqk')">工作情况</a></li>
		<li id="li_xtsx" class=""><a onclick="displaytable('xtsx')">系统属性</a></li>
		<li class="pull-right">
			<input class="btn btn-primary" type="button" value="保 存" onclick="$('#inputForm').submit();" />
			<input id="btnCancel" class="btn btn-primary" type="button" value="返 回" onclick="history.go(-1)" />
			<input TYPE='BUTTON' class="btn btn-primary" value='重置' onClick="$('#inputForm')[0].reset();">
		</li>
	</ul>
	
	<br />

	<form:form id="inputForm" modelAttribute="employee"
		action="${ctx}/ip/employee/save" method="post" class="form-horizontal">
		<form:hidden path="id" />
		<tags:message content="${message}" />
		<table id="grxx">
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="xm">姓名:</label>
						<div class="controls">
							<form:input path="xm" htmlEscape="false" maxlength="200"
								class="required" />
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label" for="gh">工号:</label>
						<div class="controls">
							<form:input path="gh" htmlEscape="false" maxlength="200"
								class="required" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="xb">性别:</label>
						<div class="controls">
							<form:select path="xb" class="input-large">
								<form:option value="0" label="请选择" />
								<form:options items="${fns:getDictList('d_xb')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="mzdm">民族:</label>
						<div class="controls">
							<form:select path="mzdm" class="input-large">
								<form:option value="0" label="请选择" />
								<form:options items="${fns:getDictList('d_mz')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="csn">出生年月:</label>
						<div class="controls">
							<input id="csn" name="csn" type="text" readonly="readonly"
								maxlength="8" class="Wdate"
								onclick="WdatePicker({dateFmt:'yyyy',isShowClear:false});" />年
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<div class="controls">
							<input id="csy" name="csy" type="text" readonly="readonly"
								maxlength="8" class="Wdate"
								onclick="WdatePicker({dateFmt:'MM',isShowClear:false});" />月
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="">年龄:</label>
						<div class="controls">
							<form:input path="" htmlEscape="false" maxlength="200" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="gjdm">国籍:</label>
						<div class="controls">
							<form:select path="gjdm" class="input-large">
								<form:option value="0" label="请选择" />
								<form:options items="${fns:getDictList('d_gj')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="zjlxdm">证件类型:</label>
						<div class="controls">
							<form:select path="zjlxdm" class="input-large">
								<form:option value="" label="请选择" />
								<form:options items="${fns:getDictList('d_zjlx')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label" for="zjh">证件号:</label>
						<div class="controls">
							<form:input path="zjh" htmlEscape="false" maxlength="200" class="required" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="zyxkdm">专业学科:</label>
						<div class="controls">
							<form:select path="zyxkdm" class="input-large">
								<form:option value="0" label="请选择" />
								<form:options items="${fns:getDictList('d_zyxk')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="xldm">学历:</label>
						<div class="controls">
							<form:select path="xldm" class="input-large">
								<form:option value="0" label="请选择" />
								<form:options items="${fns:getDictList('d_xl')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="xwdm">学位:</label>
						<div class="controls">
							<form:select path="xwdm" class="input-large">
								<form:option value="0" label="请选择" />
								<form:options items="${fns:getDictList('d_xw')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="dqjszcdm">当前技术职称:</label>
						<div class="controls">
							<form:select path="dqjszcdm" class="input-large">
								<form:option value="0" label="请选择" />
								<form:options items="${fns:getDictList('d_jszc')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="dqzzmmdm">当前政治面貌:</label>
						<div class="controls">
							<form:select path="dqzzmmdm" class="input-large">
								<form:option value="0" label="请选择" />
								<form:options items="${fns:getDictList('d_zzmm')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="hkxzdm">户口性质:</label>
						<div class="controls">
							<form:select path="hkxzdm" class="input-large">
								<form:option value="0" label="请选择" />
								<form:options items="${fns:getDictList('d_hkxz')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="hkszd">户口所在地:</label>
						<div class="controls">
							<form:input path="hkszd" htmlEscape="false" maxlength="200" value="请填写"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="zpwj">照片:</label>
						<div class="controls">
							<input id="btnPhoto" class="btn" type="button" value="上传" />
						</div>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="jgdm">籍贯:</label>
						<div class="controls">
							<form:select path="jgdm" class="input-large">
								<form:option value="" label="请选择" />
								<form:options items="${fns:getDictList('d_jg')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="csd">出生地:</label>
						<div class="controls">
							<form:input path="csd" htmlEscape="false" maxlength="200" value="请填写"/>
						</div>
					</div>
				</td>
			</tr>
		</table>

		<table id="lxfs" style="display: none">
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.sjh">手机:</label>
						<div class="controls">
							<form:input path="employeecontact.sjh" htmlEscape="false" maxlength="200" value="请填写"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.yx">邮箱:</label>
						<div class="controls">
							<form:input path="employeecontact.yx" htmlEscape="false" maxlength="200" value="请填写"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.jtlxdh">家庭联系电话:</label>
						<div class="controls">
							<form:input path="employeecontact.jtlxdh" htmlEscape="false" maxlength="200" value="请填写"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.jtzz">家庭住址:</label>
						<div class="controls">
							<form:input path="employeecontact.jtzz" htmlEscape="false" maxlength="200" value="请填写"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.jtzzyb">家庭住址邮编:</label>
						<div class="controls">
							<form:input path="employeecontact.jtzzyb" htmlEscape="false" maxlength="200" value="请填写"/>
						</div>
					</div>
				</td>
			</tr>
		</table>

		<table id="qs" style="display: none">
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs1xm">联系人1姓名:</label>
						<div class="controls">
							<form:input path="employeecontact.qs1xm" htmlEscape="false" maxlength="200" />
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs1gxdm">联系人1关系:</label>
						<div class="controls">
							<form:select path="employeecontact.qs1gxdm" class="input-large">
								<form:option value="0" label="请选择" />
								<form:options items="${fns:getDictList('')}" itemLabel="label"
									itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs1lxfs">联系人1联系方式:</label>
						<div class="controls">
							<form:input path="employeecontact.qs1lxfs" htmlEscape="false" maxlength="200" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs1szdw">联系人1所在单位:</label>
						<div class="controls">
							<form:input path="employeecontact.qs1szdw" htmlEscape="false" maxlength="200" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group"></div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs2xm">联系人2姓名:</label>
						<div class="controls">
							<form:input path="employeecontact.qs2xm" htmlEscape="false" maxlength="200" />
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs2gxdm">联系人2关系:</label>
						<div class="controls">
							<form:select path="employeecontact.qs2gxdm" class="input-large">
								<form:option value="0" label="请选择" />
								<form:options items="${fns:getDictList('')}" itemLabel="label"
									itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs2lxfs">联系人2联系方式:</label>
						<div class="controls">
							<form:input path="employeecontact.qs2lxfs" htmlEscape="false" maxlength="200" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs2szdw">联系人2所在单位:</label>
						<div class="controls">
							<form:input path="employeecontact.qs2szdw" htmlEscape="false" maxlength="200" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group"></div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs3xm">联系人3姓名:</label>
						<div class="controls">
							<form:input path="employeecontact.qs3xm" htmlEscape="false" maxlength="200" />
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs3gxdm">联系人3关系:</label>
						<div class="controls">
							<form:select path="employeecontact.qs3gxdm" class="input-large">
								<form:option value="0" label="请选择" />
								<form:options items="${fns:getDictList('')}" itemLabel="label"
									itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs3lxfs">联系人3联系方式:</label>
						<div class="controls">
							<form:input path="employeecontact.qs3lxfs" htmlEscape="false" maxlength="200" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs3szdw">联系人3所在单位:</label>
						<div class="controls">
							<form:input path="employeecontact.qs3szdw" htmlEscape="false" maxlength="200" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group"></div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs4xm">联系人4姓名:</label>
						<div class="controls">
							<form:input path="employeecontact.qs4xm" htmlEscape="false" maxlength="200" />
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs4gxdm">联系人4关系:</label>
						<div class="controls">
							<form:select path="employeecontact.qs4gxdm" class="input-large">
								<form:option value="0" label="请选择" />
								<form:options items="${fns:getDictList('')}" itemLabel="label"
									itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs4lxfs">联系人4联系方式:</label>
						<div class="controls">
							<form:input path="employeecontact.qs4lxfs" htmlEscape="false" maxlength="200" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="employeecontact.qs4szdw">联系人4所在单位:</label>
						<div class="controls">
							<form:input path="employeecontact.qs4szdw" htmlEscape="false" maxlength="200" />
						</div>
					</div>
				</td>
			</tr>
		</table>

		<table id="grjj" style="display: none">
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="grjj">个人简介:</label>
						<div class="controls">
							<form:textarea path="grjj" htmlEscape="false" maxlength="800"
								class="input-xxlarge" />
						</div>
					</div>
				</td>
			</tr>
		</table>

		<table id="gzqk" style="display: none">
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="rzsj">入职时间:</label>
						<div class="controls">
							<input id="rzsj" name="rzsj" type="text" readonly="readonly"
								maxlength="10" class="Wdate"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="cjgzsj">参加工作时间:</label>
						<div class="controls">
							<input id="cjgzsj" name="cjgzsj" type="text" readonly="readonly"
								maxlength="10" class="Wdate"
								onclick="WdatePicker({dateFmt:'yyyy-MM',isShowClear:false});" />
						</div>
					</div>
				</td>
				<td><div class="control-group">至</div></td>
				<td>
					<div class="control-group">
						<input id="" name="" type="text" readonly="readonly"
							maxlength="10" class="Wdate"
							onclick="WdatePicker({dateFmt:'yyyy-MM',isShowClear:false});" />
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="jrzyxtsj">进入专业系统时间:</label>
						<div class="controls">
							<input id="jrzyxtsj" name="jrzyxtsj" type="text"
								readonly="readonly" maxlength="10" class="Wdate"
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="jrzyxtnd">进入专业系统年度:</label>
						<div class="controls">
							<input id="jrzyxtnd" name="jrzyxtnd" type="text"
								readonly="readonly" maxlength="4" class="Wdate"
								onclick="WdatePicker({dateFmt:'yyyy',isShowClear:false});" />
						</div>
					</div>
				</td>
			</tr>
		</table>

		<table id="xtsx" style="display: none">
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="syztdm">使用状态:</label>
						<div class="controls">
							<form:select path="syztdm" class="required">
								<form:option value="0" label="请选择" />
								<form:options items="${fns:getDictList('d_shiyong')}"
									itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
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
		</table>

		<!--<div class="form-actions">
			<shiro:hasPermission name="ip:employee:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit"
					value="保 存" />&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />
		</div>   -->
	</form:form>
</body>
</html>
