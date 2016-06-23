$(function(){
  $("[data-show='bio-form']").hide();
  $("[data-show='links-form']").hide();
  $("[data-select='edit']").showForm();
  submitForm();
})

$.fn.showForm = function(e) {
  this.on("click", function(event){
    event.stopPropagation();
    var type = $(this).data().type
    $("[data-show='" + type + "-form']").show();
    $("[data-show='" + type + "']").hide();
  })
};

// function addShowFormListener(){
//   $(body).on(""click")
// }

function submitForm(){
  $("form input").keypress(function(event) {
    if (event.which == 13) {
      event.preventDefault();
      var userId = $("#user-id").html();
      $.ajax({
        method: "PATCH",
        url: "/users/" + userId,
        data: $(this).parents('form').serialize()
        })
      }
      // $("form").submit();
      // var selector = $(this).attr('id');
      // debugger;
      // $("[data-id='" + selector + "']").val($(this).val())
      // var type = $(this).parents('form').parent().data().show.split("-")[0];
      // $("[data-show='" + type + "-form']").hide();
      // $("[data-show='" + type + "']").show();
    })
  };


