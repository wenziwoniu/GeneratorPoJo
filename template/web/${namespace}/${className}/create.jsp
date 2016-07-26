<%@page import="${basepackage}.model.*" %>
<#include "/macro.include"/> 
<#include "/custom.include"/>  
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<div class="pageContent">
	<form method="post" action="<@jspEl 'ctx'/>${actionBasePath}/save.do" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
<#list table.columns as column>
<#if column.htmlHidden>
	<s:hidden id="${column.columnNameLower}" name="${column.columnNameLower}" />
</#if>
</#list>

<!-- ONGL access static field: @package.class@field or @vs@field -->
<#list table.columns as column>
	<#if !column.htmlHidden>
	
		<#if column.isDateTimeColumn>
			<p>	
				<label>
					<#if !column.nullable><span class="required">*</span></#if><%=${className}.ALIAS_${column.constantName}%>:
				</label>	
				<input  class="date" readonly="true" type="text" name="${column.columnNameLower}+'String'" value="<@jspEl 'model.'+column.columnNameLower+'String'/>" />
				<a class="inputDateButton" href="javascript:;">选择</a>
			</p>
			<#else>
			<p>
				<label>
					<#if !column.nullable><span class="required">*</span></#if><%=${className}.ALIAS_${column.constantName}%>:
				</label>	
				<input name="${column.columnNameLower}" value="<@jspEl 'model.'+column.columnNameLower/>" />	
			</p>
		</#if>
	
	</#if>
</#list>
		</div>
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>	