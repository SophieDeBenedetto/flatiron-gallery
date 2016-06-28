$(function(){
  // Styling
  $('.add-cohort').hide();
  $('.add-user').hide();
  $('.add-project').hide();
  $('.panel-success').hide();
  $('.panel-fail').hide();
  $('#user-panel').hide();
  $('#user-panel-fail').hide();


  function toggleCohort(){
    $('#add-cohort').on('click', function(){
      $('.add-cohort').slideToggle();
    });
  }

  function toggleAddUser(){
    $('#add-user').on('click', function(){
      $('.add-user').slideToggle();
    });
  }
  function toggleAddProject(){
    $('#add-project').on('click', function(){
      $('.add-project').slideToggle();
    });
  }

  $('#add-cohort').mouseover(function(){
    $(this).css({
        'color' :'blue'
    });
  });

  $('#add-cohort').mouseout(function(){
    $(this).css({
      color: 'black'
    });
  });

  $('#add-user').mouseover(function(){
    $(this).css({
        'color' :'blue'
    });
});

  $('#add-user').mouseout(function(){
    $(this).css({
      color: 'black'
    });
  });

  $('#add-project').mouseover(function(){
    $(this).css({
        'color' :'blue'
    });
});

  $('#add-project').mouseout(function(){
    $(this).css({
      color: 'black'
    });
  });


  toggleCohort();
  toggleAddUser();
  toggleAddProject();

  //form submisson


});
