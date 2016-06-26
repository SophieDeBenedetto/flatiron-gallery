$(function(){

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

  toggleCohort();
  toggleAddUser();
  toggleAddProject();
});
