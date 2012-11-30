$(function() {
  elementMethods($(".element"));
  activate_freezed_elements();
});

function elementMethods(element) { // Called on start of DOM and every time a new element is added
  element.draggable({stack: "#board .element", containment: "#board"}); // Stack for ensuring the last element appears on top
	element.droppable({
    greedy: true,
		hoverClass: "combine_element",
		deactivate: function(event, ui) {
			var elements = element;
        	elements.removeClass("combine_element");
		},
		drop: function(event, ui) {
      $("#ajax-preloader").fadeIn("fast");
      $.get('/check_elements', { element1: ui.draggable.data("name"), element2: $(this).data("name"), id1: ui.draggable.attr("id"), id2: $(this).attr("id") });
    }
	});
  
  $(".element").dblclick(function() {
    $(this).fadeOut( function() { $(this).remove(); });
  });
}


var uniqueID = function() { // http://arguments.callee.info/2008/10/31/generating-unique-ids-with-javascript/ <== Thank you!
  var id = 1; // initial value
  return function() {
    return id++;
  }; // NOTE: return value is a function reference
}(); // execute immediately


function add_to_discovered(element, image) {
  if($("#discovered-elements").find("." + element).length < 1) {
	$("#discovered-elements").append('<div data-name="' + element + '" class="freezed-element ' + element +'"></div>');
	$("style").append("." + element + "{ background: url('"+ image +"') center center no-repeat }");
  }
}

function activate_freezed_elements() {
  $(".freezed-element").live("dblclick", function() {
    element_name = $(this).data('name');
    div_element = "<div class='element " + element_name + "' data-name='" + element_name + "' id='element" + uniqueID() + "'></div>";
    $("#board").append($(div_element).hide().fadeIn());
    elementMethods($(".element"));
  });
}

/*
// Just a simple script paradigm if you want to do it javascript based the check instead of server-side check.

function checkMatch(dragged, dropped, event){
  if((dragged.attr("id") == "water") && (dropped.attr("id") == "water")){
    combineElements(dragged, dropped, event).delay(100);
  }
}

function combineElements(dragged, dropped, event) { // Called on drop event
 dragged.remove(); dropped.remove();
 var newElement = $("<div data-name=\"rain\" class=\"element\"></div>");
 $("#board").append(newElement.css("position", "absolute").css("left", event.pageX - 20).css("top", event.pageY - 20));
 elementMethods($(".element"));
 // console.log($(".element").length);
}
*/