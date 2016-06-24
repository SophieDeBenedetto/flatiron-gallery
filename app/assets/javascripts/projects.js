$(function(){
  $("[data-show='bio-form']").hide();
  $("[data-show='links-form']").hide();
  $("[data-select='edit']").showForm();
  submitForm();
  submitAvatarForm();
})

$.fn.showForm = function(e) {
  this.on("click", function(event){
    event.stopPropagation();
    var type = $(this).data().type
    $("[data-show='" + type + "-form']").show();
    $("[data-show='" + type + "']").hide();
  })
};

function submitForm(){
  $("form#user textarea").keypress(function(event) {
    handleSubmit(this);
  });
  $("form#user input").keypress(function(event) {
    handleSubmit(this);
  });
}


function handleSubmit(that){
  if (event.which == 13) {
    event.preventDefault();
    var userId = $("#user-id").html();
    $.ajax({
      method: "PATCH",
      url: "/users/" + userId,
      data: $(that).parents('form').serialize()
    })
  }
}


