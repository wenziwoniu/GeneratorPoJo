<%@page import="${basepackage}.model.*" %>
<#include "/macro.include"/> 
<#include "/custom.include"/> 
<#assign className = table.className>   
<#assign classNameLower = className?uncap_first> 
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/commons/taglibs.jsp" %>


<form id="pagerForm" method="post" action="<@jspEl 'ctx'/>${actionBasePath}/list.do" >
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="<@jspEl 'page.pageSize'/>" />
	<input type="hidden" name="orderField" value="<@jspEl 'query.sortColumns'/>" />
	<#list table.columns as column>
	<#if !column.htmlHidden>
	<#if column.isDateTimeColumn>
	<input type="hidden" name="${column.columnNameLower}Begin" value="<@jspEl 'query.'+column.columnNameLower+'Begin'/>" />
	<input type="hidden" name="${column.columnNameLower}End" value="<@jspEl 'query.'+column.columnNameLower+'End'/>" />
	<#else>
	<input type="hidden" name="${column.columnNameLower}" value="<@jspEl 'query.'+column.columnNameLower/>"/>
	</#if>
	</#if>
	</#list>	
</form>

<div class="pageHeader">
	<form onsubmit="return navTabSearch(this);" action="<@jspEl 'ctx'/>${actionBasePath}/list.do" method="post">
	<div class="searchBar">
		<ul class="searchContent">
		<#list table.columns as column>
		<#if !column.htmlHidden>
			<li>
				<label><%=${className}.ALIAS_${column.constantName}%>：</label>
				<#if column.isDateTimeColumn>
				<input class="date" readonly="true" type="text" value="<@jspEl 'query.'+column.columnNameLower+'Begin'/>" id="${column.columnNameLower}Begin" name="${column.columnNameLower}Begin"   />
				<a class="inputDateButton" href="javascript:;">选择</a>
				<input class="date" readonly="true" type="text" value="<@jspEl 'query.'+column.columnNameLower+'End'/>" id="${column.columnNameLower}End" name="${column.columnNameLower}End"   />
				<a class="inputDateButton" href="javascript:;">选择</a>
				<#else>
				<input value="<@jspEl "query."+column.columnNameLower/>" id="${column.columnNameLower}" name="${column.columnNameLower}"/>
				</#if>
			</li>
		</#if>
		</#list>
		</ul>			
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			</ul>
		</div>
	</div>
	</form>
</div>
	
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="<@jspEl 'ctx'/>${actionBasePath}/create.do" target="navTab"><span>添加</span></a></li>
			<li><a class="delete" href="<@jspEl 'ctx'/>${actionBasePath}/delete.do" rel="items" target="selectedTodo" title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		  <thead>
			  <tr>
				<th style="width:1px;"> </th>
				<th style="width:1px;"><input type="checkbox" group="items" postType="string" class="checkboxCtrl"></th>
				
				<!-- 排序时为th增加sortColumn即可,new SimpleTable('sortColumns')会为tableHeader自动增加排序功能; -->
				<#list table.columns as column>
				<#if !column.htmlHidden>
				<th sortColumn="${column.sqlName}" ><%=${className}.ALIAS_${column.constantName}%></th>
				</#if>
				</#list>
	
				<th>操作</th>
			  </tr>
			  
		  </thead>
		  <tbody>
		  	  <c:forEach items="<@jspEl 'page.result'/>" var="item" varStatus="status">
		  	  
			  <tr target="sid_user" rel="<@jspEl 'status.index'/>">
				<td>&nbsp;</td>
				<td><input type="checkbox" name="items" value="<@generateIdQueryString/>"></td>
				
				<#list table.columns as column>
				<#if !column.htmlHidden>
				<td><#rt>
					<#compress>
					<#if column.isDateTimeColumn>
					<c:out value='<@jspEl "item."+column.columnNameLower+"String"/>'/>&nbsp;
					<#else>
					<c:out value='<@jspEl "item."+column.columnNameLower/>'/>&nbsp;
					</#if>
					</#compress>
				<#lt></td>
				</#if>
				</#list>
				<td>
					<a href="<@jspEl 'ctx'/>${actionBasePath}/edit.do?<@generateIdQueryString/>" target="navTab" class="btnEdit">修改</a>
				</td>
			  </tr>
			  
		  	  </c:forEach>
		  </tbody>
		</table>
		<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共<@jspEl 'page.totalCount'/>条</span>
		</div>
		<div class="pagination" targetType="navTab" totalCount="<@jspEl 'page.totalCount'/>" numPerPage="<@jspEl 'page.pageSize'/>" pageNumShown="10" currentPage="<@jspEl 'page.thisPageNumber'/>"></div>
	</div>	
</div>


<#macro generateIdQueryString>
	<#if table.compositeId>
		<#assign itemPrefix = 'item.id.'>
	<#else>
		<#assign itemPrefix = 'item.'>
	</#if>
<#compress>
		<#list table.compositeIdColumns as column>
			<#t>${column.columnNameLower}=<@jspEl itemPrefix + column.columnNameLower/>&
		</#list>				
</#compress>
</#macro>