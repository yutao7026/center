<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table style="width: 96%;">
	<tr>
   		<td id="pageinfo" align="right" valign="middle" >
			<p class="word5">
	  			<a href="javascript:turnPage('first','pageno')" class="table_m_b">首页</a>
	  			<a href="javascript:turnPage('prev','pageno')" class="table_m_b">上一页</a>
	  			<a href="javascript:turnPage('next','pageno')" class="table_m_b">下一页</a>
	  			<a href="javascript:turnPage('end','pageno')" class="table_m_b">尾页</a> 转到：
	  			<select id="page_id" name='pageno' onchange="javascript:turnPage('go','pageno')"></select>页 共${page.totalPages}页  ${page.totalElements}条记录
	  			<script type="text/javascript">$('#page_id').html(getPageNoStr('${page.totalPages}','${pageno}'));</script>
			</p>
		</td> 
	</tr>
</table>
