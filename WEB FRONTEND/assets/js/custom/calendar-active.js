var $calendar;
$(document).ready(function () {
    let container = $("#container").simpleCalendar({
        fixedStartDay: 0, // begin weeks by sunday
        disableEmptyDetails: true,
        displayYear: true,
        displayMonth: false,
        displayMonth: true,
        disableEventDetails: false,
        events: $entries,
    });
    $calendar = container.data('plugin_simpleCalendar');
    // Event Modal PopUp
    $('#eventModal').on('show.bs.modal', function (event) {
        let eventId = $(event.relatedTarget).data('id');
        let eventName = $(event.relatedTarget).data('name');
        let eventImage = $(event.relatedTarget).data('img');
        let eventPrice = $(event.relatedTarget).data('price');
        let eventStartDate = $(event.relatedTarget).data('sdate');
        let eventRaise = $(event.relatedTarget).data('raise');
        let eventStarts = $(event.relatedTarget).data('starts');
        let eventDuration = $(event.relatedTarget).data('duration');
        let eventAccess = $(event.relatedTarget).data('access');
        let eventMaxallocation = $(event.relatedTarget).data('maxallocation');
        let eventMinallocation = $(event.relatedTarget).data('minallocation');
        let eventSocial_link_telegram = $(event.relatedTarget).data('telegram');
        let eventSocial_link_discord = $(event.relatedTarget).data('discord');
        let eventSocial_link_twitter = $(event.relatedTarget).data('twitter');
        let eventSocial_link_web = $(event.relatedTarget).data('web');
        let eventSocial_link_medium = $(event.relatedTarget).data('medium');

        let $event = $(
            '<div class="event-item">' +
            '<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">' +
                '&times;' +
            '</button>' +
            '<div class="event-top">' +
                '<div class="event-img">' +
                    '<img src="' + eventImage + '" alt="Event-img">' +
                '</div>' +
                '<div class="event-info">' +
                    '<h2>' + eventName + '</h2>' +
                    '<p>' + eventPrice + '</p>' +
                '</div>' +
            '</div>' +
            '<div class="event-time">' +
                '<h2>' + eventStartDate + '</h2>' +
            '</div>' +
            '<ul class="info-list">' +
               ' <li>' +
                   'Min Allocation:' +
                    '<span>' + eventMinallocation + '</span>'+
                '</li>' +
                ' <li>' +
                   'Max Allocation:' +
                    '<span>' + eventMaxallocation + '</span>'+
                '</li>' +
                ' <li>' +
                   'Targeted raise:' +
                    '<span>' + eventRaise + '</span>'+
                '</li>' +
                ' <li>' +
                ' Access:' +
                 '<span>' + eventAccess + '</span>'+
             '</li>' +
                '<li>' +
                   ' Social' +
                    '<ul class="social-link">' +
                        '<li><a href="' + eventSocial_link_telegram + '"><i class="icon-telegram"></i></a></li>' +
                        '<li><a href="' + eventSocial_link_twitter + '"><i class="icon-twitter"></i></a></li>' +
                        '<li><a href="' + eventSocial_link_discord + '"><i class="icon-discord"></i></a></li>' +
                        '<li><a href="' + eventSocial_link_medium + '"><i class="icon-medium"></i></a></li>' +
                        '<li><a href="' + eventSocial_link_web + '"><i class="icon-world"></i></a></li>' +
                    '</ul>' +
                '</li>' +
            '</ul>' +
            '<div class="border-shadow shadow-1"></div>' +
            '<div class="border-shadow shadow-2"></div>' +
            '<div class="border-shadow shadow-3"></div>' +
            '<div class="border-shadow shadow-4"></div>' +
        '</div>'
            );
            $(this).find(".modal-body").html($event);
        });
    });