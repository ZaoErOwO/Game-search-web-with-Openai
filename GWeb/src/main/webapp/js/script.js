  window.onload=function(){
	var current_index=0;
	var timer=window.setInterval(autoChange,5000);
	var button_li=document.getElementById("button").getElementsByTagName("li");
	var pic_div=document.getElementById("banner_pic").getElementsByTagName("div");
	for(var i=0;i<button_li.length;i++){
		button_li[i].onmouseover=function(){
			if(timer){
				clearInterval(timer);
			}
			for(var j=0;j<pic_div.length;j++){
				if(button_li[j]==this){
					current_index=j;
					button_li[j].className="current";
					pic_div[j].className="current";
				}else{
					pic_div[j].className="pic";
					button_li[j].className="but";
				}
			}
		}
		button_li[i].onmouseout=function(){
			timer=setInterval(autoChange,5000);
		}
	}
	function  autoChange(){
		++current_index;
		if(current_index==button_li.length){
			current_index=0;
		}
		for(var i=0;i<button_li.length;i++){
			if(i==current_index){
				button_li[i].className="current";
				pic_div[i].className="current";
			}else{
				button_li[i].className="but";
				pic_div[i].className="pic";
			}
		}
	}
	
	
}
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();



