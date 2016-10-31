<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>组织机构管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#id").focus();
			$("#inputForm").validate();
		});
		
		function displaytable(tablename)
		{
			var jbxx_traget=document.getElementById("jbxx");
			var bmxx_traget=document.getElementById("bmxx");
			var ywsx_traget=document.getElementById("ywsx");
			var jgsx_traget=document.getElementById("jgsx");
			
			var li_jbxx_traget=document.getElementById("li_jbxx");
			var li_bmxx_traget=document.getElementById("li_bmxx");
			var li_ywsx_traget=document.getElementById("li_ywsx");
			var li_jgsx_traget=document.getElementById("li_jgsx");
			
			if(tablename == "jbxx"){
				jbxx_traget.style.display="";
				bmxx_traget.style.display="none";
				ywsx_traget.style.display="none";
				jgsx_traget.style.display="none";
				li_jbxx_traget.className="active";
				li_bmxx_traget.className="";
				li_ywsx_traget.className="";
				li_jgsx_traget.className="";
			}else if(tablename == "bmxx"){
				jbxx_traget.style.display="none";
				bmxx_traget.style.display="";
				ywsx_traget.style.display="none";
				jgsx_traget.style.display="none";
				li_jbxx_traget.className="";
				li_bmxx_traget.className="active";
				li_ywsx_traget.className="";
				li_jgsx_traget.className="";
			}else if(tablename == "ywsx"){
				jbxx_traget.style.display="none";
				bmxx_traget.style.display="none";
				ywsx_traget.style.display="";
				jgsx_traget.style.display="none";
				li_jbxx_traget.className="";
				li_bmxx_traget.className="";
				li_ywsx_traget.className="active";
				li_jgsx_traget.className="";
			}else if(tablename == "jgsx"){
				jbxx_traget.style.display="none";
				bmxx_traget.style.display="none";
				ywsx_traget.style.display="none";
				jgsx_traget.style.display="";
				li_jbxx_traget.className="";
				li_bmxx_traget.className="";
				li_ywsx_traget.className="";
				li_jgsx_traget.className="active";
			}
			
		}
		function jgbm_unique(){
			var jgbm_unique_error = document.getElementById("jgbm_unique_error");
			var jgbm = new Array();
			jgbm = document.getElementsByClassName("jgbm_unique");
			for(var i = 0;i < jgbm.length;i++){
				if(jgbm_input.value==jgbm[i].innerHTML){
					jgbm_unique_error.style.display = "inline";
					return
				}
				jgbm_unique_error.style.display = "none";
			}
			return
		}
		
		window.onload = function(){
			var jgbm_input = document.getElementById("jgbm_input");
			jgbm_input.onblur = function(){
				jgbm_unique();
			}
		}
		
	</script>
</head>
<body>
	<div style="display:none">
		<c:forEach items="${list}" var="organization">
			<p class="jgbm_unique">${organization.jgbm}</p>
		</c:forEach>
	</div>
	<ul class="nav nav-tabs">
		<li id="li_jbxx" class="active"><a onclick="displaytable('jbxx')">基本信息</a></li>
		<li id="li_bmxx"><a onclick="displaytable('bmxx')">编码信息</a></li>
		<li id="li_ywsx"><a onclick="displaytable('ywsx')">业务属性</a></li>
		<li id="li_jgsx"><a onclick="displaytable('jgsx')">机构属性</a></li>
	</ul><br/>
	
	<form:form id="inputForm" modelAttribute="organization" action="${ctx}/ip/organization/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<tags:message content="${message}"/>

		<table id="jbxx">
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="jgmc">机构名称:</label>
						<div class="controls">
							<form:input path="jgmc" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label" for="xzzgldmc">行政主管领导名称:</label>
						<div class="controls">
							<form:input path="xzzgldmc" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="jgjc">机构简称:</label>
						<div class="controls">
							<form:input path="jgjc" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label" for="xzfgldmc">行政副管领导名称:</label>
						<div class="controls">
							<form:input path="xzfgldmc" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="jgbm">机构编码:</label>
						<div class="controls">
							<form:input id="jgbm_input" path="jgbm" htmlEscape="false" maxlength="200" class="required"/>
							<label class="error" for="jgbm" id="jgbm_unique_error" style="display:none">编码重复</label>
						</div>
						
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label" for="dwzgldmc">党务主管领导名称:</label>
						<div class="controls">
							<form:input path="dwzgldmc" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="wz">网址:</label>
						<div class="controls">
							<form:input path="wz" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label" for="dwfgldmc">党务副管领导名称:</label>
						<div class="controls">
							<form:input path="dwfgldmc" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="yx">邮箱:</label>
						<div class="controls">
							<form:input path="yx" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label" for="jgjj">机构简介:</label>
						<div class="controls">
							<form:input path="jgjj" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="lxdh">联系电话:</label>
						<div class="controls">
							<form:input path="lxdh" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label" for="sfyfz">是否有分址:</label>
						<div class="controls">
							<form:select path="sfyfz" class="input-xlarge">
							  <option value ="0">没有</option>  
							  <option value ="1">有</option>    
							</form:select>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="dz">地址:</label>
						<div class="controls">
							<form:input path="dz" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
				</td>
				<td>
					<div class="control-group">
						<label class="control-label" for="xssx">顺序排序:</label>
						<div class="controls">
							<form:input path="xssx" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="control-group">
						<label class="control-label" for="yb">邮编:</label>
						<div class="controls">
							<form:input path="yb" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="control-group">
						<label class="control-label" for="remarks">备注:</label>
						<div class="controls">
							<form:input path="remarks" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
						</div>
					</div>
				</td>
			</tr>
		</table>
		
		<table id="bmxx" style="display:none">
			<tr><td>
				<div class="control-group">
						<label class="control-label" for="jtbm">集团编码:</label>
						<div class="controls">
							<form:input path="jtbm" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
						</div>
					</div>
			</td></tr>
			<tr><td>
				<div class="control-group">
						<label class="control-label" for="hybm">行业编码:</label>
						<div class="controls">
							<form:input path="hybm" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
						</div>
					</div>
			</td></tr>
			<tr><td>
				<div class="control-group">
						<label class="control-label" for="qtbm">其它编码:</label>
						<div class="controls">
							<form:input path="qtbm" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
						</div>
					</div>
			</td></tr>
		</table>
		<table id="ywsx" style="display:none">
			<tr><td>
				<div class="control-group">
						<label class="control-label" for="sfqjxjg">是否全局性机构:</label>
						<div class="controls">
							<form:select path="sfqjxjg" class="input-xlarge">
							  <option value ="0">否</option>  
							  <option value ="1">是</option>    
							</form:select>
						</div>
					</div>
			</td></tr>
			<tr><td>
				<div class="control-group">
						<label class="control-label" for="sfstxjg">是否实体性机构:</label>
						<div class="controls">
							<form:select path="sfstxjg" class="input-xlarge">
							  <option value ="0">否</option>  
							  <option value ="1">是</option>    
							</form:select>
						</div>
					</div>
			</td></tr>
			<tr><td>
				<div class="control-group">
						<label class="control-label" for="ywlx">业务类型:</label>
						<div class="controls">
							<form:select path="ywlx">
								<form:options items="${fns:getDictList('d_ywlx')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
			</td></tr>
			<tr><td>
				<div class="control-group">
						<label class="control-label" for="czlx">出资类型:</label>
						<div class="controls">
							<form:select path="czlx">
								<form:options items="${fns:getDictList('d_czlx')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
			</td></tr>
			<tr><td>
				<div class="control-group">
						<label class="control-label" for="jglx">机构类型:</label>
						<div class="controls">
							<form:select path="jglx">
								<form:options items="${fns:getDictList('d_jglx')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
			</td></tr>

		</table>
		
		<table id="jgsx" style="display:none">
			<!-- <tr><td>
				<div class="control-group">
						<label class="control-label" for="">所属机构:</label>
						<div class="controls">
			                <tags:treeselect id="" name="organization.jgmc" value="${organization.id}" labelName="organization.jgmc" labelValue="${organization.jgmc}"
								title="所属机构" url="/ip/organization/treeData"/>
						</div>
					</div>
			</td></tr>
			<tr><td>
				<div class="control-group">
						<label class="control-label" for="sshy">所属行业:</label>
						<div class="controls">
							<form:select path="sshy" class="input-xlarge">
							  <option value ="0">未定义</option>  
							  <option value ="1">未定义</option>    
							</form:select>
						</div>
					</div>
			</td></tr> -->
			<tr><td>
				<div class="control-group">
						<label class="control-label" for="jjxz">经济性质:</label>
						<div class="controls">
							<form:select path="jjxz">
								<form:options items="${fns:getDictList('d_jjxz')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
			</td></tr>
			<tr><td>
				<div class="control-group">
						<label class="control-label" for="hyxz">行业性质:</label>
						<div class="controls">
							<form:select path="hyxz">
								<form:options items="${fns:getDictList('d_xyxz')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
			</td></tr>
			<tr><td>
				<div class="control-group">
						<label class="control-label" for="scgm">产品规模:</label>
						<div class="controls">
							<form:select path="scgm">
								<form:options items="${fns:getDictList('d_scgm')}" itemValue="value" itemLabel="label" htmlEscape="false"/>
							</form:select>
						</div>
					</div>
			</td></tr>
			<tr><td>
				<div class="control-group">
						<label class="control-label" for="sfqy">是否启用:</label>
						<div class="controls">
							<form:select path="sfqy" class="input-xlarge">
							  <option value ="0">否</option>  
							  <option value ="1" selected>是</option>    
							</form:select>
						</div>
					</div>
			</td></tr>
		</table>
		
		<div class="form-actions">
			<shiro:hasPermission name="ip:organization:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
