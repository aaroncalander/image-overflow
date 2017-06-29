$(document).ready(function(){
  upvoteCount();
  downvoteCount();
})

var upvoteCount = function(){
  $('.upvote').on('click', function(event){
    event.preventDefault();
    var $upvote = $(this);
    var action = $(this).attr('action');
    var method = $(this).attr('method');
    var voteData = $(this).serialize();


    $.ajax({
      url: action,
      method: method,
      data: voteData
    }).done(function(response){
      $($upvote.siblings()[0]).text(response);
    }).fail(function(){
      alert('you suck!')
    })
  })
}

var downvoteCount = function(){
  $('.downvote').on('click', function(event){
    event.preventDefault();
    var $downvote = $(this);
    var action = $(this).attr('action');
    var method = $(this).attr('method');
    var voteData = $(this).serialize();


    $.ajax({
      url: action,
      method: method,
      data: voteData
    }).done(function(response){
      $($downvote.siblings()[2]).text(response);
    }).fail(function(){
      alert('you suck!')
    })
  })
}
