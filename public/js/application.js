$(document).ready(function() {
  $(".loginn").on("click",function(event){
    event.preventDefault();
    var url = $(this).attr("href");
    $.ajax({
      method: "GET",
      url: url,
    }).done(function(response){
      $("span#form").html(response);
    })
  });

  // $("span#form").on("submit",".loginsubmit",function(event){
  //   event.preventDefault();
  //   var url = $(this).attr("action");
  //   var data = $(this).serialize();
  //   $.ajax({
  //     method: "POST",
  //     url: url,
  //     data: data,
  //   })
  // });
});
