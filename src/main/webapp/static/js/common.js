function getClass(className,tagname) {
    if(typeof tagname == 'undefined') tagname = '*';
    if(typeof(getElementsByClassName) == 'function') {
        return getElementsByClassName(className);
    }else {
        var tagname = document.getElementsByTagName(tagname);
        var tagnameAll = [];
        for(var i = 0; i < tagname.length; i++) {
            if(tagname[i].className == className) {
                tagnameAll[tagnameAll.length] = tagname[i];
            }
        }
        return tagnameAll;
    }
}

function split_str(string,words_per_line) {
    if(typeof string == 'undefined' || string.length == 0) return '';
    if(typeof words_per_line == 'undefined' || isNaN(words_per_line)){
        words_per_line = 50;
    }
    words_per_line = parseInt(words_per_line);
		var output_string = "";
		var toutput_string = "";
		for(var i = 0; i < string.length; i ++){
			var b = false;
			if(toutput_string.replace(/[^\x00-\xff]/g, "**").length % words_per_line == words_per_line - 1 && string.substring(i, i + 1).replace(/[^\x00-\xff]/g, "**").length == 2){
				b = true;				
			}
			output_string += string.substring(i, i + 1);
			toutput_string += string.substring(i, i + 1)
			if(toutput_string.replace(/[^\x00-\xff]/g, "**").length % words_per_line == 0 || b){
				output_string += "<br />"; 
			}
		}
    
    return output_string;
}

function titleMouseOver(obj,event,words_per_line) {
    if(typeof obj.title == 'undefined' || obj.title == '') return false;
    var title_show = document.getElementById("title_show");
    if(title_show == null){
        title_show = document.createElement("div");                            
        document.getElementsByTagName('body')[0].appendChild(title_show);    
        var attr_id = document.createAttribute('id');                        
        attr_id.nodeValue = 'title_show';                                    
        title_show.setAttributeNode(attr_id);                                
        
        var attr_style = document.createAttribute('style');                    
        attr_style.nodeValue = 'position:absolute;'                           
            +'border:solid 1px #999999; background:#EDEEF0;'              
            +'border-radius:2px;box-shadow:2px 3px #999999;'               
            +'line-height:18px;'                                           
            +'font-size:12px; padding: 2px 5px;';                           
        try{
            title_show.setAttributeNode(attr_style);                       
        }catch(e){
            title_show.style.position = 'absolute';
            title_show.style.border = 'solid 1px #999999';
            title_show.style.background = '#EDEEF0';
            title_show.style.lineHeight = '18px';
            title_show.style.fontSize = '18px';
            title_show.style.padding = '2px 5px';
        }
    }
    document.title_value = obj.title;
    obj.title = '';
    if(typeof words_per_line == 'undefined' || isNaN(words_per_line)){
        words_per_line = 50;
    }
    words_per_line = parseInt(words_per_line);
    title_show.innerHTML = split_str(document.title_value,words_per_line);
    title_show.style.display = 'block';
    
    event = event || window.event;                            
    var top_down = 15;                                        
    var left = Math.min(event.clientX,document.body.clientWidth-title_show.clientWidth);
    title_show.style.left = left+"px";           
    title_show.style.top = (event.clientY + top_down)+"px";
}
function titleMouseOut(obj) {
    var title_show = document.getElementById("title_show");
    if(title_show == null) return false;    
    obj.title = document.title_value;
    title_show.style.display = "none";
}

function attachTipEvent(objs,words_per_line){
    if(typeof objs != 'object') return false;
    if(typeof words_per_line == 'undefined' || isNaN(words_per_line)){
        words_per_line = 50;
    }
    for(i=0;i<objs.length;i++){
        objs[i].onmouseover = function(event){
            titleMouseOver(this,event,words_per_line);
        }
        objs[i].onmouseout = function(event){
            titleMouseOut(this);
        }
    }
}