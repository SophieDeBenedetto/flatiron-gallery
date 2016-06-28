$(function(){
  $("[data-show='bio-form']").hide();
  $("[data-show='links-form']").hide();
  $("[data-select='edit']").showForm();
  submitForm();
  addTechField();
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

function addTechField() {
  $("#new-project").on("click", $("[data-select='add-new-tech']"), function(e){
   if (e.toElement.dataset.select == "add-new-tech") {
      var num = 0
      if ($(".new-tech").length != 0) {
        var num = $(".new-tech").length
      }
      $(".tech-checkbox").append("<div class='field new-tech'><input name='project[new_technologies][" + num + "][name]' placeholder='new tech name'></div>")   
   }
  })
}


