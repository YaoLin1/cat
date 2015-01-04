<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="res" uri="http://www.unidal.org/webres"%>
<%@ taglib prefix="w" uri="http://www.unidal.org/web/core"%>
<jsp:useBean id="ctx" type="com.dianping.cat.system.page.config.Context" scope="request"/>
<jsp:useBean id="payload" type="com.dianping.cat.system.page.config.Payload" scope="request"/>
<jsp:useBean id="model" type="com.dianping.cat.system.page.config.Model" scope="request"/>
<a:config>
	<res:useJs value="${res.js.local['jquery.validate.min.js']}" target="head-js" />
	<res:useJs value="${res.js.local['dependencyConfig.js']}" target="head-js" />
	<res:useCss value="${res.css.local['select2.css']}" target="head-css" />
	<res:useJs value="${res.js.local['select2.min.js']}" target="head-js" />
	<res:useCss value="${res.css.local['jqx.base.css']}" target="head-css" />
	<res:useJs value="${res.js.local['jqxcore.js']}" target="head-js" />
	<res:useJs value="${res.js.local['jqxbuttons.js']}" target="head-js" />
	<res:useJs value="${res.js.local['jqxscrollbar.js']}" target="head-js" />
	<res:useJs value="${res.js.local['jqxlistbox.js']}" target="head-js" />
    <res:useJs value="${res.js.local['jqxcombobox.js']}" target="head-js" />
<script type="text/javascript">
		$(document).ready(function() {
		$('#application_config').addClass('active open');
		$('#exception').addClass('active');

		var source = new Array();  
		source = "${model.exceptionList}".replace(/[\[\]]/g,'').split(', '); 

		if(document.getElementById("jqxcombobox")) {
       		$("#jqxcombobox").jqxComboBox({ source: source, selectedIndex: 0, width: '200px', height: '25px' });
		}
		});
		
		function setWidth(){
			var sel =  document.getElementById("domainId");
			sel.style.width = ((sel.offsetWidth < 200) ? '200' : 'auto');
		}
</script>

<form name="exceptionConfig" id="form" method="post"
	action="${model.pageUri}?op=exceptionExcludeUpdateSubmit&domain=${payload.domain}&exception=${payload.exception}&type=异常过滤">
	<h4 class="text-center text-danger" id="state">&nbsp;</h4>
	<h4 class="text-center text-danger">修改异常报警配置信息</h4>
	<table class="table table-striped table-condensed   table-hover">
	<c:set  var="action" value="exceptionExcludeUpdate"/>
		<tr>
			<td style="text-align:right" class="text-success">项目名称</td>
			<td>
			<c:choose>
			<c:when test="${payload.action.name eq action}">
				<input name="exceptionExclude.domain" value="${model.exceptionExclude.domain}" readonly required/>
			</c:when>
			<c:otherwise>
				<select name="exceptionExclude.domain" id="domainId" style="width:200px;">
					<c:forEach var="item" items="${model.domainList}">
                        <option value="${item}">${item}</option> 							
					</c:forEach>
                </select>
			</c:otherwise>
			</c:choose>
			</td>
		</tr>

		<tr>
			<td style="text-align:right" class="text-success">异常名称</td>
			<td>
			<c:choose>
			<c:when test="${payload.action.name eq action}">
				<input name="exceptionExclude.id" size="35" value="${model.exceptionExclude.id}"/>
			</c:when>
			<c:otherwise>
				<div id="jqxcombobox" name='exceptionExclude.id' >
		        </div>
			</c:otherwise>
			</c:choose>
			</td>
		</tr>
		<tr>
			<td colspan='2'  style="text-align:center"><input class='btn btn-primary' id="addOrUpdateExceptionConfigSubmit" type="submit"
				name="submit" value="提交"/></td>
		</tr>
	</table>
</form>
</a:config>