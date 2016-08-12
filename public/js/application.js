$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
    $("#question_answer_form_container").hide()
    $("#answer_question_btn").on('click', function () {
        $("#question_answer_form_container").show()
    }); 
});
