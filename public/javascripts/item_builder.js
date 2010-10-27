$(function(){
	$(".add_item").click(function(){

		var id = new Date().getTime() + ''; 

		var fields = "<p> <label for=\"event_items_attributes_" + id + "_name\">Name</label> <input id=\"event_items_attributes_" + id + "_name\" name=\"event[items_attributes][new_" + id + "][name]\" size=\"30\" type=\"text\" /> <label for=\"event_items_attributes_" + id + "_quantity\">Quantity</label> <input id=\"event_items_attributes_" + id + "_quantity\" name=\"event[items_attributes][new_" + id + "][quantity]\" size=\"30\" type=\"text\" /> <label for=\"event_items_attributes_" + id + "_accepts_note\">Accepts note</label> <input name=\"event[items_attributes][new_" + id + "][accepts_note]\" type=\"hidden\" value=\"0\" /><input id=\"event_items_attributes_" + id + "_accepts_note\" name=\"event[items_attributes][new_" + id + "][accepts_note]\" type=\"checkbox\" value=\"1\" /></p>";

		$('#items').append(fields);
		return false;
	});		
});