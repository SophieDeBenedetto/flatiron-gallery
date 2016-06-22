(function ($) {
    'use strict';

    $(window).on('load', function () {
        /* Preloader */
        $('#preloader').fadeOut( 400, function () {
            debugger;
            $(this).remove();
        });

        // Slider Revolution

        })

    $(document).ready(function () {

        /* Isotope Portfolio */
        (function () {
            var grid = $('.grid').isotope({
                itemSelector: '.grid-item',
                percentPosition: true,
                masonry: {
                    // use outer width of grid-sizer for columnWidth
                    columnWidth: '.grid-sizer'
                }
            });

            grid.imagesLoaded(function () {
                grid.isotope();
            });

            grid.isotope({filter: '*'});

            // filter items on button click
            $('#isotope-filters').on('click', 'a', function () {
                var filterValue = $(this).attr('data-filter');
                grid.isotope({filter: filterValue});
            });

        })();
        

        // Sidebar
        $("#wrapper").on('click', '#menu-toggle', function(e) {
            e.preventDefault();
            $("#wrapper").toggleClass("toggled");
            $(".cbp-af-header").toggleClass("toggled");
            // resize isotope layout at 100ms after css transition (0.5s)
            setTimeout(function() {
                $('.grid').isotope('layout');
            }, 600);
        });
        

        // Parallax
        $('#insert').parallax("50%", 0.3);


        // Goal Progress
        $('#proto').goalProgress({
            goalAmount: 600,
            currentAmount: 436,
            textBefore: '',
            textAfter: ' projects'
        });
        $('#develop').goalProgress({
            goalAmount: 1000,
            currentAmount: 885,
            textBefore: '',
            textAfter: ' projects'
        });
        $('#design').goalProgress({
            goalAmount: 1000,
            currentAmount: 374,
            textBefore: '',
            textAfter: ' projects'
        });
        $('#testing').goalProgress({
            goalAmount: 1000,
            currentAmount: 672,
            textBefore: '',
            textAfter: ' projects'
        });

        /* Animated Counter */
        $('.count-container span').counterUp({
            delay: 10, // the delay time in ms
            time: 3000 // the speed time in ms
        });
        
        /* Magnific Popup */
        $('.gallery-item').magnificPopup({
            type: 'image',
            gallery: {
                enabled: true
            }
        });

        /* Contact Form */
        (function () {
            // Get the messages div.
            var formMessages = $('#form-messages');

            // Set up an event listener for the contact form.
            $('#feedback-block').on('submit', '#ajax-contact', function (e) {
                // Get the form.
                var $form = $(this);

                // Stop the browser from submitting the form.
                e.preventDefault();

                // Serialize the form data.
                var formData = $form.serialize();

                // Submit the form using AJAX.
                $.ajax({
                        type: 'POST',
                        url: $form.attr('action'),
                        data: formData
                    })
                    .done(function (response) {
                        // Make sure that the formMessages div has the 'success' class.
                        $(formMessages).removeClass('alert alert-danger');
                        $(formMessages).addClass('alert alert-success');

                        // Set the message text.
                        $(formMessages).text(response);

                        // Clear the form.
                        $('#name').val('');
                        $('#email').val('');
                        $('#message').val('');
                    })
                    .fail(function (data) {
                        // Make sure that the formMessages div has the 'error' class.
                        $(formMessages).removeClass('alert alert-success');
                        $(formMessages).addClass('alert alert-danger');

                        // Set the message text.
                        if (data.responseText !== '') {
                            $(formMessages).text(data.responseText);
                        } else {
                            $(formMessages).text('Oops! An error occured and your message could not be sent.');
                        }
                    });
            });

        })();
        


        /* Google map */
        (function () {
            if (!$('#google-map').length) {
                return false;
            }

            initGmap();

            function initGmap() {

                // Create an array of styles.
                var styles = [
                    {
                        stylers: [
                            {saturation: -100}
                        ]
                    }, {
                        featureType: "road",
                        elementType: "geometry",
                        stylers: [
                            {lightness: 100},
                            {visibility: "simplified"}
                        ]
                    }, {
                        featureType: "road",
                        elementType: "labels",
                        stylers: [
                            {visibility: "off"}
                        ]
                    }
                ];

                // Create a new StyledMapType object, passing it the array of styles,
                // as well as the name to be displayed on the map type control.
                var styledMap = new google.maps.StyledMapType(styles, {name: "Styled Map"});

                // Create a map object, and include the MapTypeId to add
                // to the map type control.
                var $latlng = new google.maps.LatLng(29.198351, -81.028046),
                    $mapOptions = {
                        zoom: 13,
                        center: $latlng,
                        panControl: false,
                        zoomControl: true,
                        scaleControl: false,
                        mapTypeControl: false,
                        scrollwheel: false,
                        mapTypeControlOptions: {
                            mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
                        }
                    };
                var map = new google.maps.Map(document.getElementById('google-map'), $mapOptions);

                google.maps.event.trigger(map, 'resize');

                //Associate the styled map with the MapTypeId and set it to display.
                map.mapTypes.set('map_style', styledMap);
                map.setMapTypeId('map_style');

                var marker = new google.maps.Marker({
                    position: $latlng,
                    map: map,
                    title: ""
                });

            }

        })();

        // Dropdown on Hover
        // $('.navbar .dropdown').hover(function() {
        //     $(this).find('.dropdown-menu').first().stop(true, true).slideDown(150);
        // }, function() {
        //     $(this).find('.dropdown-menu').first().stop(true, true).slideUp(105)
        // });


    });



    /* Google Analytics */
    (function (i, s, o, g, r, a, m) {
       i['GoogleAnalyticsObject'] = r;
       i[r] = i[r] || function () {(i[r].q = i[r].q || []).push(arguments)};
       i[r].l = 1 * new Date();
       a = s.createElement(o);
       m = s.getElementsByTagName(o)[0];
       a.async = 1;
       a.src = g;
       m.parentNode.insertBefore(a, m);
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-40696437-14', 'auto');
    ga('send', 'pageview');

})(jQuery);
