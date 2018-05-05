import OnToggle from 'ontoggle';

$(document).ready(function() {
    /*------------------------------------*\
      Instantiate OnToggle
    \*------------------------------------*/
    let myOnToggle = new OnToggle();

    console.log(myOnToggle);


    // Send search queries to google
    $('.search-form__submit').on('click', function(event) {
        event.preventDefault();
        let searchQuery = $('.search-form__query').val();
        let google = "http://google.com/search?q=site:henkubao.com ";

        let searchQueryGoogle = google + searchQuery;
        // window.location.href = google + searchQuery;
        window.open(searchQueryGoogle);
    });

});
