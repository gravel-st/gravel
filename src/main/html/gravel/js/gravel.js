function click(callbackID)
{
	document.getElementById("callbackField").setAttribute("value", callbackID);
	document.getElementById("processForm").submit();
}

$(function() {	
	Gravel.Events.forEach(function(evdata) {
		$('#' + evdata[0]).on(evdata[1], function() {
			click(evdata[2]);
		});
	});

	var textarea = $('.transcript')[0];
	textarea.scrollTop = textarea.scrollHeight;
});