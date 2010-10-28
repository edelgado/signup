$(function(){
	$(".add_item").click(function(){

		var id = new Date().getTime() + ''; 

		var fields = "<p> <img style=\"cursor: move;\" src=\"/images/drag-v.gif\" alt=\"Drag-v\"/> <label for=\"event_items_attributes_" + id + "_name\">Name</label> <input id=\"event_items_attributes_" + id + "_name\" name=\"event[items_attributes][new_" + id + "][name]\" size=\"30\" type=\"text\" /> <label for=\"event_items_attributes_" + id + "_quantity\">Quantity</label> <input id=\"event_items_attributes_" + id + "_quantity\" name=\"event[items_attributes][new_" + id + "][quantity]\" size=\"30\" type=\"text\" /> <label for=\"event_items_attributes_" + id + "_accepts_note\">Accepts note</label> <input name=\"event[items_attributes][new_" + id + "][accepts_note]\" type=\"hidden\" value=\"0\" /><input id=\"event_items_attributes_" + id + "_accepts_note\" name=\"event[items_attributes][new_" + id + "][accepts_note]\" type=\"checkbox\" value=\"1\" /><input id=\"event_items_attributes_" + id + "_sorting_order\" type=\"hidden\" value=\"\" name=\"event[items_attributes][new_" + id + "][sorting_order]\"/></p>";

        // Append element
		$('#items').append(fields);
		
		// Reset internal order fields:
		$("input[id$='_sorting_order']").each(function(i) {
            $(this).val(i + 1);
        });
		return false;
	});
	
    $("#items").sortable({
            stop: function(event, ui) {
                $("input[id$='sorting_order']").each(function(i) {
                    $(this).val(i + 1);
                });
            },
            opacity: 0.5
        });
    
    
});