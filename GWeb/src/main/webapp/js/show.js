function switchover() {
	var show1 = document.getElementById("show1");
	var show2 = document.getElementById("show2");
	if (show1.style.display == "none") {
		show1.style.display = "block";
		show2.style.display = "none";
	} else {
		show2.style.display = "block";
		show1.style.display = "none";
	}
}
