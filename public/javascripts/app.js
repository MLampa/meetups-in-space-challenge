//JAVASCRIPT CODE GOES HERE
  $("#create_meetup_form").on("submit", function(event){
    event.preventDefault();

    var title_boolean = false;
    var details_boolean = false;
    var tags_boolean = false;
    var alertMessage = "Missing fields!"

    var inputTitle = $("#title").val();
    if (filled(inputTitle)) {
      alertMessage += "\nPlease create a meetup name.";
    } else {
      title_boolean = true;
    };

    var inputDetails = $("#details").val();
    if (filled(inputDetails)) {
      alertMessage += "\nPlease add a meetup description.";
    } else {
      details_boolean = true;
    };

    var inputTags = $("#tags").val();
    if (filled(inputTags)) {
      alertMessage += "\nPlease add tags to your meetup."
    } else {
      tags_boolean = true;
    };

    if (!title_boolean || !details_boolean || !tags_boolean){
      alert(alertMessage);
    }
    else {
      submitMeetupsViaAjax(inputTitle, inputDetails, inputTags)
    }
});

var filled = function(input) {
  return (input == null || input == "" || /^\s*$/.test(input))
}

var submitMeetupsViaAjax = function(title, details, tags) {
  debugger;
  var request = $.ajax({
    method: "POST",
    url: "/meetups",
    data: { title: title, details: details, tags: tags }
  });
  request.done(function(responseData) {
    $(".meetups").append("<h3>" + title + "</h3><p>" + details + "</p><p>" + tags + "</p>");
  });
};

$("#join_meetup_form").on("submit", function(event){
  event.preventDefault();
  meetup_id = $("#join_meetup_form").attr('meetup_id');
  submitJoinMeetupViaAjax(meetup_id);

});

var submitJoinMeetupViaAjax = function(meetup_id) {
  var request = $.ajax({
    method: "POST",
    url: '/meetups_join.json',
    data: { meetup_id: meetup_id }
  });
  request.done(function(responseData) {
    alert("You have successfully joined this meetup.");
  });
}
