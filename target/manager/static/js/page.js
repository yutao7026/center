function turnPage(direction,docid){
	var index;
	if(docid=='pageno')
		index= form1.pageno.value;
	else
		index= form1.pageno1.value;
	
	//form1.action="";
	//form1.method="get";
	//form1.target="_self";
	if(direction=='prev'){
		if(index>1){
			if(docid=='pageno')
				form1.pageno.options[index-2].selected = true;
			else
				form1.pageno1.options[index-2].selected = true;
			form1.submit();
		}
	}else if(direction=='next'){
		
		
			if(docid=='pageno')
			{
				if(index<form1.pageno.length){
				form1.pageno.options[index].selected = true;}
			}
			else{if(index<form1.pageno1.length)
				form1.pageno1.options[index].selected = true;}
			form1.submit();
		
	}else if(direction=='first'){
		if(index>1){
			if(docid=='pageno')
				form1.pageno.options[0].selected = true;
			else
				form1.pageno1.options[0].selected = true;
			form1.submit();
		}
	}else if(direction=='end'){
		
			if(docid=='pageno'){
				if(index<form1.pageno.length)
					form1.pageno.options[form1.pageno.length-1].selected = true;
			}
			else{
				if(index<form1.pageno1.length)
					form1.pageno1.options[form1.pageno1.length-1].selected = true;
			}
			form1.submit();
		
	}else if(direction=='go'){
		form1.submit();
	}else{
		return false;
	}
}

function getPageNoStr(pagecount,pageno){
	var str = "";
	for(var i=1;i<=pagecount;i++){
		if(i==pageno){
			str+="<option value="+i+" selected>"+i+"</option>";
		}else{
			str+="<option value="+i+">"+i+"</option>";
		}
	}
	return str;
}
